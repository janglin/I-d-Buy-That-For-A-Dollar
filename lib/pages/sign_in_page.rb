class SignInPage
  include PageObject

  text_field(:email_address, :id => "session_email_address")
  text_field(:password, :id => "session_password")
  checkbox(:remember_me, :id => "session_remember_me")
  button(:sign_in, :id => "session_submit")

  def sign_in_as_levi
    self.email_address = "levi+groupon_test@leviwilson.com"
    self.password = "too many secrets"
    uncheck_remember_me
    sign_in
  end
end