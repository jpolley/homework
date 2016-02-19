# hello wildbit family!

## instructions (assuming you already have ruby installed)
```
$ git clone https://jpolley@bitbucket.org/jpolley/jpolley_specs.git
$ cd jpolley_specs
$ gem install bundler
$ bundle install
$ rspec .
```

## Firefox is the default browser

But if you would like to see the specs run much faster install the chrome webdriver
and then update spec_helper.rb:10
```ruby
browser = Watir::Browser.new :chrome
```
