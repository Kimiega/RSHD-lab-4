# DDB Homework 4

## Build & Run

The whole infrastructure can be ran as

```bash
docker compose up --build --force-recreate --remove-orphans
```

Then you can connect to the cluster

```bash
psql -h localhost -p 9999 -U postgres
```