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

When /^I am observing the categories for the "([^"]*)" deal$/ do |which_deal|
  the_deal = on_page(AllDealsPage).the_deals(:text => /#{which_deal}/).first
  @the_categories = the_deal.categories
end

Then /^I have the option to express that I like deals about:$/ do |categories|
  expected_categories = categories.hashes.map {|row| row["Category"]}
  @the_categories.should eq(expected_categories)
end

When /^I categorize "([^"]*)" as "([^"]*)"$/ do |which_deal, which_category|
  pending
end

Then /^then next time my deal knows that I like "([^"]*)" about it$/ do |which_category|
  pending
end