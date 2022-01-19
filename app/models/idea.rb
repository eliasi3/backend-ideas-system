class Idea < ApplicationRecord
  belongs_to :category
  belongs_to :mission
  belongs_to :user

  # has_many para quando deletar alguma ideia, deletar também os dados de idea_file referenciado ela
  has_many :idea_file, dependent: :destroy

end
