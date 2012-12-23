Given /^I would like to see all deals available to me in "([^"]*), ([^"]*)"$/ do |city, state|
  navigate_to(AllDealsPage, :using => :all_deals_for_levi) do |all_deals|
    all_deals.choose_deals_in(city, state)
  end
end

When /^all of the available deals have been displayed$/ do
  on_page(AllDealsPage).display_all_deals
end

Then /^I should have a good idea on how to save some serious cash$/ do
  on_page(AllDealsPage) do |page|
    page.the_deals.count.should eq(page.total_number_of_deals)
    page.the_deals.each &:print
  end
end