ActionMailer::Base.smtp_settings = {
  :address              => "smtp.mandrillapp.com",
  :port                 => 587,
  :user_name            => "patrick.mulholland@gmx.de",
  :password             => "ewoRsx6WlIDo5OZERaKxFA",
  :authentication       => "plain",
  :enable_starttls_auto => true
}