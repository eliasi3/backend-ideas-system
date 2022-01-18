class AddIesMultiToMissions < ActiveRecord::Migration[6.1]
  def change
    add_column :missions, :ies_multi, :integer
  end
end
