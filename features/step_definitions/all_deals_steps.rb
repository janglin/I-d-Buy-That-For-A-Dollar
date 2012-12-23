Given /^I would like to see all deals available to me in "([^"]*)"$/ do |which_area|
  visit_page(HomePage).go_to_sign_in
  on_page(SignInPage) do |page|
    page.email_address = "levi+groupon_test@leviwilson.com"
    page.password = "too many secrets"
    page.uncheck_remember_me
    page.sign_in
  end
end

When /^all of the available deals have been displayed$/ do
  pending
end

Then /^I should have a good idea on how to save some serious cash$/ do
  pending
end