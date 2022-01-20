class ChangeIntegerFormatInIdeas < ActiveRecord::Migration[6.1]
  def change
    change_column :ideas, :ies_status, :varchar
  end
end
