# Check Docker disk usage
docker system df

# Clean up unused Docker resources
docker system prune -a

#===== Docker Desktop on Windows Cleanup ======
# Clean up Docker resources on Windows (if using Docker Desktop) after cleaning up in WSL
# Docker Desktop uses its own separate VHD (ext4.vhdx) stored in a different location:
# "C:\Users\user\AppData\Local\Docker\wsl\disk\docker_data.vhdx" and "C:\Users\user\AppData\Local\Docker\wsl\data\ext4.vhdx"
# Close Docker Desktop and kill processes in Task Manager
```powershell
diskpart
```
# In diskpart prompt:
```
select vdisk file="C:\Users\user\AppData\Local\Docker\wsl\disk\docker_data.vhdx" # Enter
attach vdisk readonly # Enter
compact vdisk # Enter
detach vdisk # Enter
exit
```
# ================================================
# ================================================

# Openclaw commands inside docker
docker compose exec openclaw openclaw <command>

# Update openclaw
docker compose pull openclaw && docker compose up -d openclaw

# Add agent to openclaw
docker compose exec openclaw openclaw agents add content-strategist

# Start the whole fortress in the background
docker compose up -d

# Stop everything (safely)
docker compose down

# Restart ONLY the bot (run this after editing openclaw.json)
docker compose restart openclaw

# See what is currently running and on which ports
docker compose ps

# Watch the bot's "thoughts" in real-time (The most used command)
docker compose logs -f openclaw

# Check if the Tailscale "Tunnel" is actually connected
docker compose logs -f tailscale

# Check LiteLLM (The Brain) for API errors or balance issues
docker compose logs -f litellm

# Approve a new device (like your phone) instantly
docker compose exec openclaw openclaw devices approve --latest

# List all paired/pending devices
docker compose exec openclaw openclaw devices list

# Generate a brand new Gateway Token if you get locked out
docker compose exec openclaw openclaw doctor --generate-gateway-token

# Fix tailscale_state permission issues)
sudo rm -rf ./tailscale_state

# Remove all unused containers, networks, and images
docker system prune -a

# Check how much disk space Docker is eating
docker system df