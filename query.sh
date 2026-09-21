#!/bin/bash
# Helper script to run SQL files against the Docker DB

if [ -z "$1" ]; then
    echo "Usage: ./query.sh <your_query_file.sql>"
    exit 1
fi

docker exec -i sql_lab_db psql -U student -d company_db < "$1"
