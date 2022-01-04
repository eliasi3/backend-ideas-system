class Dept < ApplicationRecord
    has_many :users
    has_many :mission
end
