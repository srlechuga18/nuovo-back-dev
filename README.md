# Nuovo Back

## Self Host

### Requirments
- Git
- Docker

### Installing and Running
#### Get the code
```
git clone --depth 1 https://github.com/supabase/supabase
```

#### Go to the docker folder
```
cd supabase/docker
```

#### Copy the fake env vars
```
cp .env.example .env
```

#### Pull the latest images
```
docker compose pull
```

#### Start the services (in detached mode)
```
docker compose up -d
```

#### Change credentials on .env to Supabase Studio

Username: supabase
Password: this_password_is_insecure_and_should_be_updated

DASHBOARD_USERNAME=supabase
DASHBOARD_PASSWORD=this_password_is_insecure_and_should_be_updated

#### APIs Routes
 - REST: http://<your-ip>:8000/rest/v1/
 - Auth: http://<your-domain>:8000/auth/v1/
 - Storage: http://<your-domain>:8000/storage/v1/
 - Realtime: http://<your-domain>:8000/realtime/v1/

#### Change keys and passwords on .env

 - POSTGRES_PASSWORD=your-super-secret-and-long-postgres-password
 - JWT_SECRET=your-super-secret-jwt-token-with-at-least-32-characters-long
 - ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE
 - SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJzZXJ2aWNlX3JvbGUiLAogICAgImlzcyI6ICJzdXBhYmFzZS1kZW1vIiwKICAgICJpYXQiOiAxNjQxNzY5MjAwLAogICAgImV4cCI6IDE3OTk1MzU2MDAKfQ.DaYlNEoUrrEn2Ig7tqibS-PHK5vgusbcbo7X36XVt4Q

#### Change site url and api external url on .env

 - SITE_URL=http://localhost:3000
 - API_EXTERNAL_URL=http://localhost:8000
 - SUPABASE_PUBLIC_URL=http://localhost:8000


## Supabase CLI

### 1. Download CLI
```
npm install supabase --save-dev
```

### 2. init local enviroment 
```
npx supabase init
```

### Start Local supabase
```
npx supabase start
```

## Sync DB Structure

### Sync from remote to local

#### Get remote structure
```
npx supabase db diff -f initial_structure --db-url postgresql://postgres.your-tenant-id:your-super-secret-and-long-postgres-password@localhost:6543/postgres
```

#### Reset Local instance
```
npx supabase db reset
```

### Sync from local to remote

#### Get local changes
```
npx supabase db diff -f changes_made
```

#### Apply local changes to remote
```
npx supabase db push --db-url postgresql://postgres.your-tenant-id:your-super-secret-and-long-postgres-password@localhost:6543/postgres
```
if the remote db is empty will be no problem but if not an already exist error will pop.
You will need to run this
```
npx supabase migration repair 20241106232733 --status applied --db-url postgresql://postgres.your-tenant-id:your-super-secret-and-long-postgres-password@localhost:6543/postgres
npx supabase migration repair <timestamp_of_migration_file> --status applied --db-url postgresql://postgres.your-tenant-id:your-super-secret-and-long-postgres-password@localhost:6543/postgres
```
Then you can run the first command (Push command)

Here you might have an error of must be owner of table, for that in the remote you can run 
```
ALTER TABLE table_name OWNER TO postgres;
ALTER TABLE notes OWNER TO postgres;
```
only once will be enough to fix the problem for that table on all the development process.


## Sync DB Data

### Sync from remote to local

#### Get remote data
```
npx supabase db dump --data-only -f supabase/seed.sql --db-url postgresql://postgres.your-tenant-id:your-super-secret-and-long-postgres-password@localhost:6543/postgres
```

#### Reset Local instance
```
npx supabase db reset
```

### Sync from local to remote