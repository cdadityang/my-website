# frozen-string-literal: true
require 'rspec'
require 'capybara/rspec'
require 'capybara/dsl'
require 'selenium-webdriver'

Selenium::WebDriver.logger.level = :debug
Selenium::WebDriver.logger.output = File.dirname(Dir.pwd) + '/my-website/log/selenium.log'
ENV['DISPLAY']=':99.0'

geckodriver_path = "/usr/local/bin/geckodriver"
firefox_binary_path = "/snap/bin/firefox"
# Enable for local
# firefox_binary_path = "/Applications/Firefox.app/Contents/MacOS/firefox"
driver_service = Selenium::WebDriver::Firefox::Service.new
driver_service.executable_path = geckodriver_path
options = Selenium::WebDriver::Firefox::Options.new(binary: firefox_binary_path)

Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new(app, service: driver_service, options: options)
end

Capybara.default_driver = :firefox
Capybara.javascript_driver = :firefox
Capybara.app_host = 'http://127.0.0.1:3005/src'
Capybara.default_max_wait_time = 5

RSpec.configure do |config|
  config.before(:suite) do
    system "yarn test_start"
    system "sleep 5"
    puts "---------------"
    puts "RUNNING TESTS"
    puts "---------------"
  end

  config.before(:each) do
    config.include Capybara::DSL
  end

  config.after(:suite) do
    system "yarn test_stop"
  end
end