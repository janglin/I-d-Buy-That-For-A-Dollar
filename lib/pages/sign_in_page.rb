class SignInPage
  include PageObject

  text_field(:email_address, :id => "session_email_address")
  text_field(:password, :id => "session_password")
  checkbox(:remember_me, :id => "session_remember_me")
  button(:sign_in, :id => "session_submit")
end