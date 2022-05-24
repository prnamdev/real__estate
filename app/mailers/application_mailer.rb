class ApplicationMailer < ActionMailer::Base
  default from: 'noreplyexample99@gmail.com'
  layout 'mailer'

  def send_it(email)
  @email = email

  mail(
    from: email.user.email,
    to: current_user.Broker.email,
    subject: email.subject
  )
  end
end
