require 'watir-webdriver'
require 'cucumber'

Given(/^a user goes to Amazon$/) do
  @browser = Watir::Browser.new :ff
  @browser.goto "https://www.amazon.com"
end

When(/^they search for "([^"]*)"$/) do |arg|
  @browser.text_field(:id => "twotabsearchtextbox").set "#{arg}"
  @browser.send_keys :return
end


Then(/^amazon should return results for "([^"]*)"$/) do |arg|
  @browser.div(:id => "result 2").wait_until_present
  page_output = @browser.div(:id => "resultsCol").text_include? "#{arg}" #this variable is a workaround because no matter what arg is added watir is returning true
  assert (page_output == true)
  @browser.close
end