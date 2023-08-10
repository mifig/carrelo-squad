# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome
    message = Message.first
    UserMailer.welcome(message)
  end
end
