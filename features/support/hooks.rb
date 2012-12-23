require 'watir-webdriver'

Before do
  @browser = Watir::Browser.new :firefox
  visit_page(HomePage)
end

After do
  @browser.close
end