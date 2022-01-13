class User < ApplicationRecord
  belongs_to :dept
  has_many :mission
  has_secure_password

  
  after_create :welcome_mail


  private

  def welcome_mail
    UserMailer.welcome_email(self).deliver_now
  end

  def self.reset_password(email)
    @user = User.find_by_email(email)
    UserMailer.recuperar_senha(@user).deliver_now
  end
end
