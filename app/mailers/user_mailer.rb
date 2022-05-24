class UserMailer < ApplicationMailer
  def post_created
    @user = params[:user]
    @property = params[:property]
    @greeting = "Hi"
    mail to: @property&.user&.email,
    subject: "Interested"
  end
end
