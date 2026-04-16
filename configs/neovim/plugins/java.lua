return {
	-- Additional Mason tools for Java/Spring
	{
		"mason-org/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"google-java-format",
				"checkstyle",
				"spring-boot-tools",
			})
		end,
	},

	-- Extend nvim-jdtls with Spring Boot support and richer settings
	{
		"mfussenegger/nvim-jdtls",
		opts = function(_, opts)
			-- Comprehensive JDTLS settings for Java + Spring Boot
			opts.settings = vim.tbl_deep_extend("force", opts.settings or {}, {
				java = {
					eclipse = { downloadSources = true },
					configuration = {
						updateBuildConfiguration = "interactive",
						runtimes = {
							{ name = "JavaSE-17", path = "/usr/lib/jvm/java-17-openjdk-amd64/" },
							{ name = "JavaSE-21", path = "/usr/lib/jvm/java-21-openjdk-amd64/" },
						},
					},
					maven = { downloadSources = true },
					gradle = { enabled = true },
					implementationsCodeLens = { enabled = true },
					referencesCodeLens = { enabled = true },
					references = { includeDecompiledSources = true },
					signatureHelp = { enabled = true, description = { enabled = true } },
					contentProvider = { preferred = "fernflower" }, -- better decompiler
					inlayHints = {
						parameterNames = { enabled = "all" },
					},
					completion = {
						guessMethodArguments = "auto",
						favoriteStaticMembers = {
							"org.hamcrest.MatcherAssert.assertThat",
							"org.hamcrest.Matchers.*",
							"org.junit.jupiter.api.Assertions.*",
							"org.mockito.Mockito.*",
							"org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*",
							"org.springframework.test.web.servlet.result.MockMvcResultMatchers.*",
						},
						filteredTypes = {
							"com.sun.*",
							"io.micrometer.shaded.*",
							"java.awt.*",
							"jdk.*",
							"sun.*",
						},
					},
					sources = {
						organizeImports = {
							starThreshold = 9999,
							staticStarThreshold = 9999,
						},
					},
					codeGeneration = {
						toString = {
							template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
						},
						hashCodeEquals = {
							useJava7Objects = false,
							useInstanceof = false,
						},
						useBlocks = true,
					},
					project = {
						encoding = "warning",
					},
				},
			})

			-- Inject Spring Boot Tools JAR as a JDTLS bundle (if installed via Mason)
			opts.jdtls = function(config)
				local mason_path = vim.fn.expand("$MASON")
				local spring_jars = vim.fn.glob(
					mason_path .. "/packages/spring-boot-tools/extension/jars/*.jar",
					false,
					true
				)
				if #spring_jars > 0 then
					config.init_options = config.init_options or {}
					config.init_options.bundles = config.init_options.bundles or {}
					vim.list_extend(config.init_options.bundles, spring_jars)
				end
				return config
			end

			-- Spring Boot keymaps on LspAttach (appended to LazyVim's default on_attach)
			local upstream_on_attach = opts.on_attach
			opts.on_attach = function(args)
				if upstream_on_attach then
					upstream_on_attach(args)
				end

				require("which-key").add({
					{
						mode = "n",
						buffer = args.buf,
						{ "<leader>js", group = "spring" },
						{
							"<leader>jsr",
							function()
								local root = vim.fs.root(0, { "pom.xml", "build.gradle", "build.gradle.kts" })
								if not root then
									return vim.notify("No Maven/Gradle project found", vim.log.levels.WARN)
								end
								if vim.fn.filereadable(root .. "/mvnw") == 1 then
									vim.cmd("split | terminal cd " .. root .. " && ./mvnw spring-boot:run")
								elseif vim.fn.filereadable(root .. "/gradlew") == 1 then
									vim.cmd("split | terminal cd " .. root .. " && ./gradlew bootRun")
								else
									vim.notify("No mvnw or gradlew found", vim.log.levels.WARN)
								end
							end,
							desc = "Spring Boot Run",
						},
						{
							"<leader>jsb",
							function()
								local root = vim.fs.root(0, { "pom.xml", "build.gradle", "build.gradle.kts" })
								if not root then
									return vim.notify("No Maven/Gradle project found", vim.log.levels.WARN)
								end
								if vim.fn.filereadable(root .. "/mvnw") == 1 then
									vim.cmd("split | terminal cd " .. root .. " && ./mvnw clean package -DskipTests")
								elseif vim.fn.filereadable(root .. "/gradlew") == 1 then
									vim.cmd("split | terminal cd " .. root .. " && ./gradlew build -x test")
								end
							end,
							desc = "Spring Boot Build",
						},
						{
							"<leader>jst",
							function()
								local root = vim.fs.root(0, { "pom.xml", "build.gradle", "build.gradle.kts" })
								if not root then
									return vim.notify("No Maven/Gradle project found", vim.log.levels.WARN)
								end
								if vim.fn.filereadable(root .. "/mvnw") == 1 then
									vim.cmd("split | terminal cd " .. root .. " && ./mvnw test")
								elseif vim.fn.filereadable(root .. "/gradlew") == 1 then
									vim.cmd("split | terminal cd " .. root .. " && ./gradlew test")
								end
							end,
							desc = "Spring Boot Test (all)",
						},
						{
							"<leader>jsD",
							function()
								local root = vim.fs.root(0, { "pom.xml", "build.gradle", "build.gradle.kts" })
								if not root then
									return vim.notify("No Maven/Gradle project found", vim.log.levels.WARN)
								end
								if vim.fn.filereadable(root .. "/mvnw") == 1 then
									vim.cmd(
										"split | terminal cd "
											.. root
											.. " && ./mvnw spring-boot:run -Dspring-boot.run.jvmArguments='-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=*:5005'"
									)
								elseif vim.fn.filereadable(root .. "/gradlew") == 1 then
									vim.cmd(
										"split | terminal cd "
											.. root
											.. " && ./gradlew bootRun --debug-jvm"
									)
								end
							end,
							desc = "Spring Boot Debug (suspend on :5005)",
						},
					},
				})
			end

			return opts
		end,
	},

	-- DAP: Spring Boot debug configurations
	{
		"mfussenegger/nvim-dap",
		optional = true,
		opts = function()
			local dap = require("dap")
			dap.configurations.java = dap.configurations.java or {}
			vim.list_extend(dap.configurations.java, {
				{
					type = "java",
					request = "attach",
					name = "Attach Spring Boot (Remote :5005)",
					hostName = "127.0.0.1",
					port = 5005,
				},
				{
					type = "java",
					request = "launch",
					name = "Launch Spring Boot (Local)",
					mainClass = function()
						return vim.fn.input("Main class: ", "com.example.Application")
					end,
					vmArgs = "-Dspring.profiles.active=dev",
					args = "",
				},
			})
		end,
	},
}
