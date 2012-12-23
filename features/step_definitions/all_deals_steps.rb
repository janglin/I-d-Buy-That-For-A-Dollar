Given /^I would like to see all deals available to me in "([^"]*), ([^"]*)"$/ do |city, state|
  navigate_to(AllDealsPage, :using => :all_deals_for_levi) do |all_deals|
    all_deals.choose_deals_in(city, state)
  end
end

When /^all of the available deals have been displayed$/ do
  on_page(AllDealsPage) do |page|
    while page.more_deals?
      page.more_deals_element.click
    end
  end
end

Then /^I should have a good idea on how to save some serious cash$/ do
  pending
end