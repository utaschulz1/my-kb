# get local repo to github
# Go to github and create a new repository (without README, .gitignore, or license), copy link

# Reinitialize repo
git init

# Restore ignore and add files
git add -A
git commit -m "chore: reinitialize repository"

# Ensure branch name (change if you prefer 'master')
git branch -M main

# Add new origin (replace with your repo URL)
git remote add origin git@github.com:YOUR_USER/YOUR_REPO.git
# or with HTTPS:
git remote add origin https://github.com/YOUR_USER/YOUR_REPO.git

# Push initial commit and set upstream
git push -u origin main

# If you only need to change the remote (keep history), run:
git remote set-url origin git@github.com:YOUR_USER/YOUR_REPO.git
# then push if needed
git push -u origin main
```git remote set-url origin git@github.com:YOUR_USER/YOUR_REPO.git
# then push if needed
git push -u origin main
#------------------------------------------
#Only clone certain branch:
git clone -b Charles https://github.com/your-username/your-repo.git

# Confirm
git branch 

#------------------------------------------
# Inspect remotes
git remote -v
git remote show origin

# See current branch / commits
git branch --show-current
git status
git log --oneline --decorate --max-count=5 || true  # shows nothing if no commits

# If there are NO commits yet: create an initial commit and push
git add -A
git commit -m "chore: initial commit"
git branch -M main
git push -u origin main

# If you already have commits on a different branch (e.g. master), either push that branch:
git push -u origin master
# Or push whatever branch you currently have:
git push -u origin HEAD

------------------------------------------------------
# Backup the git data (safe)
mv .git .git.bak-$(date +%s)

# OR remove git entirely (destructive)
rm -rf .git

-----------------------------------------------
# user info
git config --get-all user.name
git config --get-all user.email

# set user info (if needed)
git config user.name "username"
git config user.email "your.email@example.com"

------------------------------------------------
# Github API: Get tree 
tree_url = "https://api.github.com/repos/oasis-tcs/dita/git/trees/master?recursive=1"
data = requests.get(tree_url).json()

------------------------------------------------