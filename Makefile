install:
	bundle install

lint:
	rubocop

run_test:
	ruby test/test_hexlet_code.rb