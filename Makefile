deploy:
	ansible-playbook playbook.yml -i hosts --limit="production"

init:
	ansible-playbook playbook.yml -i hosts --limit="production" --extra-vars="init=y"

upgrade:
	ansible-playbook playbook.yml -i hosts --extra-vars="update=y"
