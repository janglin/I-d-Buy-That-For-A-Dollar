Given /^I would like to see all deals available to me in "([^"]*)"$/ do |which_area|
  visit_page(HomePage).go_to_sign_in
  on_page(SignInPage).sign_in_as_levi
  on_page(FeaturedDealPage).all_deals
end

When /^all of the available deals have been displayed$/ do
  pending
end

Then /^I should have a good idea on how to save some serious cash$/ do
  pending
end