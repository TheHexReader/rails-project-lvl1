install:
	bundle install

lint:
	rubocop -a

run_test:
	bundle exec rake test