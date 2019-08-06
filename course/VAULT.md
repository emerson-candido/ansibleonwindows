# Generate a 30 random password string
head /dev/urandom | tr -dc A-Za-z0-9 | head -c 20 ; echo ''

# Create a encryption string
ansible-vault encrypt_string --vault-password-file .secret-azure $(cat .secret-file) --name teste

https://docs.ansible.com/ansible/latest/user_guide/vault.html#encrypt-string-for-use-in-yaml

