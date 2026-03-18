# Go to user directory
cd ~

# Find user profile
$env:USERNAME

# Show administrator privileges
$IsAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
if ($IsAdmin) {
    Write-Host "You have administrator privileges."
} else {
    Write-Host "You do not have administrator privileges."
}

# Find administrator user profile
$adminUser = Get-WmiObject -Class Win32_UserAccount -Filter "Name='Administrator'"
if ($adminUser) {
    Write-Host "Administrator user profile found: $($adminUser.Name)"
} else {
    Write-Host "Administrator user profile not found."
}

# Remove recursive directory
Remove-Item -Path "old_directory" -Recurse -Force

# output text to console
Write-Host "Hello, World!"

# Create a new directory
New-Item -Path "new_directory" -ItemType Directory

# Create a new file with content
New-Item -Path "new_file.txt" -ItemType File -Value "Hello, World!"

# List all files in the current directory
Get-ChildItem -Path . -File

# Get the content of a file
Get-Content -Path "new_file.txt"



