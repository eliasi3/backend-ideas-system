class Mission < ApplicationRecord
  belongs_to :dept
  belongs_to :user
  
end
