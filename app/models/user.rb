# require 'bcrypt'

class User < ApplicationRecord
  belongs_to :dept
  has_many :mission
  has_secure_password validations: false

  # include BCrypt

  # def password_digest
  #   @password_digest ||= Password.new(password_hash)
  # end
  after_create :welcome_mail
  # after_show :reset_password

  private

  def welcome_mail
    UserMailer.welcome_email(self).deliver_now
  end

  def reset_password
    UserMailer.recuperar_senha(self).deliver_now
  end
end
