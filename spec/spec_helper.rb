$: << File.dirname(__FILE__)+'/../lib'

require 'includes.rb'

browser = Watir::Browser.new :chrome
browser.window.maximize

RSpec.configure do |config|
  config.include PageObject::PageFactory
  config.before(:all) { @browser = browser }
  #config.after(:suite) { browser.close }
  config.example_status_persistence_file_path = './spec/examples.txt'
end
