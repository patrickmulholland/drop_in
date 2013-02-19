ActionMailer::Base.smtp_settings = {
  :address              => "mail.gmx.net",
  :port                 => 25,
  :domain               => "gmx.net",
  :user_name            => "patrick.mulholland@gmx.de",
  :password             => "Babylon23",
  :authentication       => "plain",
  :enable_starttls_auto => true
}