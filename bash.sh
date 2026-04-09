# update package lists and upgrade installed packages
sudo apt update          # refresh package lists
sudo apt upgrade         # upgrade installed packages
sudo apt update && sudo apt upgrade  # both


# change file permissions: add execute permission to a script file
chmod +x myscript.py
ls -l # shows permissions, should have 'x' for execute

#download a file from the internet using wget
wget https://example.com/file.txt
# using curl to download a file
curl -LO https://example.com/file.txt  # -L follows redirects, -O saves with original filename

# unzip a file
sudo apt install unzip
unzip archive.zip -d destination_folder

# check folder size
du -sh /home/user/folder/path/ollama_data/
# map biggest folders
du -h --max-depth=2 /home/user | sort -rh | head -20
