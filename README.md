[![hexlet-check](https://github.com/TheHexReader/rails-project-lvl1/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/TheHexReader/rails-project-lvl1/actions/workflows/hexlet-check.yml)
[![test](https://github.com/TheHexReader/rails-project-lvl1/actions/workflows/test.yml/badge.svg)](https://github.com/TheHexReader/rails-project-lvl1/actions/workflows/test.yml)
[![lint](https://github.com/TheHexReader/rails-project-lvl1/actions/workflows/lint.yml/badge.svg)](https://github.com/TheHexReader/rails-project-lvl1/actions/workflows/lint.yml)

# HexletCode

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/hexlet_code`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hexlet_code'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install hexlet_code

## Usage

To create form, use:

```ruby
HexletCode.form_for user do |f|
  f.input :name                   # To create an input field 
  f.input :description, as: :text # To create a textarea field
  f.submit                        # To create a submit button
end
```

To create individual html tags, use:

```ruby
HexletCode::Tag.build('p', class: 'paragraph', id: 'main-paragraph') { 'Content of tag!' }

=> "<p class=\"paragraph\" id=\"main-paragraph\">Content of tag!</p>"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thehexreader/hexlet_code.
