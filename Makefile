ENVIRONMENT	:= "production"
PLAYBOOK	:= "playbook.yml"

# Parameter 1: playbook file
# Parameter 2: options
define provision
ansible-playbook $(1) $(2)
endif

deploy: $(PLAYBOOK)
	$(call provision, $<, "--limit=$(ENVIRONMENT)")
	
init: $(PLAYBOOK)
	$(call provision, $<, "--limit=$(ENVIRONMENT) --extra-vars='init=y'")

upgrade: $(PLAYBOOK)
	$(call provision, $<, "--extra-vars='update=y'")
