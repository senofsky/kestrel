# This Makefile handles the following operations for kestrel:
#
#    - Static type checking
#    - Testing

# Perform static type checking
.PHONY: check-types
check-types:
	mypy --strict kestrel

# Execute tests
.PHONY: test
test:
	make -C test all

test-%:
	make -C test $*
