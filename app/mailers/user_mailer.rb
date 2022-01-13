class UserMailer < ApplicationMailer
    default from: 'dinoghost11@gmail.com'

  def welcome_email
    @user = params[:user]
    @url  = 'http://exemplo.com/login'
    mail(to: @user.email, subject: 'Boas vindas ao nosso incrível site!')
  end
end
