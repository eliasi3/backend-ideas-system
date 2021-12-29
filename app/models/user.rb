class User < ApplicationRecord
  belongs_to :dept
  has_secure_password
end
