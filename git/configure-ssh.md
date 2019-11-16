# Create local ssh key

ssh-keygen -t rsa -b 4096 -C "arek.czubik@gmail.com"
eval $(ssh-add -s)
ssh-add ~/.ssh/id_rsa

# Add key to github account

And then go to github add configure ssh key from content of ~/.ssh/id_rsa.pub

# Set local git repository's remotes to ssh

git remote set-url origin git@github.com:Arkadiusz-Czubik@dotfiles.git
