# require 'bcrypt'

class User < ApplicationRecord
  belongs_to :dept
  has_secure_password validations: false

  # include BCrypt

  # def password_digest
  #   @password_digest ||= Password.new(password_hash)
  # end

  # def password_digest=(new_password)
  #   @password_digest = Password.create(new_password)
  #   self.password_hash = @password_digest
  # end
end
