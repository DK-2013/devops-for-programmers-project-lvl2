setup:
	ansible-galaxy install -r requirements.yml

deploy:
	ansible-playbook --ask-vault-pass playbook.yml -i inventory.ini

secrets:
	ansible-vault encrypt --vault-password-file vault-password group_vars/webservers/secrets.yml
	#ansible-vault encrypt_string --vault-password-file vault-password 'your secret message' --name

opensec:
	ansible-vault decrypt --vault-password-file vault-password group_vars/webservers/secrets.yml
