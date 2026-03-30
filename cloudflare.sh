# login
uv run pywrangler login

# Watch out! With Python workers the remote deploy doesn't work reliably and the remote snapshot can get out of sync. 

# Deploy live:
npm run deploy

# Or seed Miniflare's local R2 using wrangler. Makes a local SQLite db and serve them via the R2 binding during npm run dev. Do this once for all localfiles in R2:
cd /home/hpz400/projects/Doublesession-scheduler/Cloudflare_app/doublesession-worker

uv run pywrangler r2 object put doublesession-data/movies_by_title.json --file ../input/movies_by_title.json --local
uv run pywrangler r2 object put doublesession-data/festival_italiano.json --file ../input/festival_italiano.json --local

# deploy locally
cd /home/hpz400/projects/Doublesession-scheduler/Cloudflare_app/doublesession-worker
npm run dev

# if it has a R2 bucket (non-Python workers):
npx wrangler dev --remote
# or
uv run pywrangler dev --remote
