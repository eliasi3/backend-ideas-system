class AddRazaoIdToIdeas < ActiveRecord::Migration[6.1]
  def change
    add_column :ideas, :razao_id, :integer
  end
end
