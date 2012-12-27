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
  @the_deal = on_page(AllDealsPage).the_deals(:text => /#{which_deal}/).first
  @the_deal.categorize_as which_category
end

Then /^then next time my deal knows that I like "([^"]*)" about it$/ do |expected_category|
  @the_deal.active_categories.should include(expected_category)
  @the_deal.clear_active_categories
end

When /^I have no interest in "([^"]*)"$/ do |uninteresting_deals|
  @uninteresting_deals = uninteresting_deals.split(", ").sort
  on_page(AllDealsPage).choose_to_ignore *@uninteresting_deals
end

Then /^the deals I think are not interesting will be remembered$/ do
  on_page(AllDealsPage) do |page|
    page.ignored_deals.sort.should eq(@uninteresting_deals)
  end
end

When /^I am curious about "([^"]*)"s deal of the day$/ do |whose_deal|
  on_page(AllDealsPage) do |page|
    the_deal = page.the_deals(:text => /#{whose_deal}/).first
    the_deal.more_info
  end
end

Then /^I am presented more information about "([^"]*)"s deal of the day$/ do |whose_deal|
  on_page(FeaturedDealPage).title.should match("#{whose_deal} Deal of the Day")
end

When /^I've decided the featured deal is exactly what I want$/ do
  on_page(AllDealsPage) do |page|
    @expected_price = page.the_deals.first.price
    page.buy_now
  end
end

Then /^I can immediately add the featured deal to my order$/ do
  on_page(PurchasePage).my_price.should eq(@expected_price)
end
