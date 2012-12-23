class HomePage
  include PageObject

  link(:go_to_sign_in, :text => "Sign In")

  page_url("http://www.groupon.com/")
end