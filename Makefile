install:
	bundle install

lint:
	rubocop -a

run_test:
	ruby test/test_hexlet_code.rb; ruby test/hexlet_code/tag.rb