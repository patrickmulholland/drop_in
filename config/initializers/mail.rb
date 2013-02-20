ActionMailer::Base.smtp_settings = {
  :address              => "smtp.mandrillapp.com",
  :port                 => 587,
  :user_name            => "patrick.mulholland@gmx.de",
  :password             => "babylon23",
  :authentication       => "plain",
  :enable_starttls_auto => true
}