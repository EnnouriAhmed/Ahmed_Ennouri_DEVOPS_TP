#!/usr/bin/env bash
set -e
mkdir -p db/init
cat > docker-compose.yml <<'YML'
services:
  pg:
    image: postgres:16-alpine
    environment:
      POSTGRES_DB: dbexo6
      POSTGRES_USER: user6
      POSTGRES_PASSWORD: exo6mdp
    ports: ["5433:5432"]
    volumes:
      - pgdata6:/var/lib/postgresql/data
      - ./db/init:/docker-entrypoint-initdb.d
volumes:
  pgdata6:
YML
cat > db/init/01-init.sql <<'SQL'
CREATE TABLE IF NOT EXISTS users(
  id SERIAL PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  email VARCHAR(120) UNIQUE NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS products(
  id SERIAL PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  price NUMERIC(10,2) NOT NULL,
  stock INTEGER NOT NULL DEFAULT 0
);
SQL
docker compose up -d