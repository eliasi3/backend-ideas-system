class AddIesStatusToIdeas < ActiveRecord::Migration[6.1]
  def change
    add_column :ideas, :ies_status, :integer
  end
end
