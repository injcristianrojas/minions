CURRENT_DIR = $(shell pwd)
STACK_NAME = my-stack
JSON_FILE = multiple.json

create_template:
	python template_maker.py > $(JSON_FILE)

create_stack: create_template
	aws cloudformation create-stack --stack-name $(STACK_NAME) --template-body file://$(CURRENT_DIR)/$(JSON_FILE)

delete_stack:
	aws cloudformation delete-stack --stack-name $(STACK_NAME)

deploy: create_template create_stack

clean:
	rm $(JSON_FILE)
