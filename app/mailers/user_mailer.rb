class UserMailer < ApplicationMailer

  def welcome(message)
    @user = User.first
    @message = message
    mail(to: @user.email, subject: "#{@message.email} | #{@message.subject}")
  end
end
