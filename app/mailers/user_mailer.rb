class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Boas vindas ao nosso incrível site!')
  end
  
  def recuperar_senha(user)
    @user = user
    mail(to: @user.email, subject: 'Recuperação de senha!')
  end
end
