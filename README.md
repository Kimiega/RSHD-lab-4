# DDB Homework #4

## Build & Run

Start with starting all services:

```bash
./infra/start.sh
```

Then try to insert some rows:

```bash
./client/run.sh
```

Then criminal comes out of place:

```bash
./primary/shell.sh
./criminal/oom.sh
```

Then try to insert some rows:

```bash
./client/run.sh
```
