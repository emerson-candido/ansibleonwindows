ansible-playbook clouds_azure_create_vm.yml --vault-password-file .secret-azure --extra-vars "$(cat extra-vars/azure.yml | tr '\n' ' ' | sed 's/ ---/\n---/g')"

