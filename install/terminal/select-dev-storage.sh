#!/bin/bash

# Install default databases
if [[ -v BTW_FIRST_RUN_DBS ]]; then
	dbs=$BTW_FIRST_RUN_DBS
else
	AVAILABLE_DBS=("MySQL" "Redis" "PostgreSQL")
	dbs=$(gum choose "${AVAILABLE_DBS[@]}" --no-limit --height 5 --header "Select databases (runs in Docker)")
fi

if [[ -n "$dbs" ]]; then
	for db in $dbs; do
		case $db in
		MySQL)
			sg docker -c "docker rm -f mysql8; docker run -d --restart unless-stopped -p '127.0.0.1:3306:3306' --name=mysql8 -e MYSQL_ROOT_PASSWORD= -e MYSQL_ALLOW_EMPTY_PASSWORD=true mysql:8.4"
			;;
		Redis)
			# Stop system redis-server if running to free port 6379
			if systemctl is-active --quiet redis-server 2>/dev/null; then
				sudo systemctl stop redis-server
				sudo systemctl disable redis-server
			fi
			sg docker -c "docker rm -f redis; docker run -d --restart unless-stopped -p '127.0.0.1:6379:6379' --name=redis redis:7"
			;;
		PostgreSQL)
			sg docker -c "docker rm -f postgres16; docker run -d --restart unless-stopped -p '127.0.0.1:5432:5432' --name=postgres16 -e POSTGRES_HOST_AUTH_METHOD=trust postgres:16"
			;;
		esac
	done
fi
