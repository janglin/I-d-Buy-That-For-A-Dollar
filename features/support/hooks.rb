require 'watir-webdriver'

Before do
  @browser = Watir::Browser.new :firefox
  visit_page(HomePage)
end

After do |scenario|
  if scenario.title == "Hiding deals that we are not interested in"
    on_page(AllDealsPage).clear_ignored_deals
  end

  @browser.close
end
