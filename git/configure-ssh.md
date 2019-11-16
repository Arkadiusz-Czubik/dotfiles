ssh-keygen -t rsa -b 4096 -C "arek.czubik@gmail.com"
eval $(ssh-add -s)
ssh-add ~/.ssh/id_rsa

And then go to github add configure ssh key from content of ~/.ssh/id_rsa.pub
