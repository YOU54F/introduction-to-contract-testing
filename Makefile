all: test

test: test_order_consumer test_customer_consumer test_address_provider

test_order_consumer:
	cd order-consumer
	mvn test
test_customer_consumer:
	cd customer-consumer
	mvn test
test_address_provider:
	cd address-provider
	mvn test

cirrus_macos_arm:
	cirrus run --output github-actions macos_arm
cirrus_linux_arm:
	cirrus run --output github-actions linux_arm
cirrus_linux_amd:
	cirrus run --output github-actions macos_amd
act_linux_amd:
	act --container-architecture linux/amd64 --matrix os:ubuntu-latest