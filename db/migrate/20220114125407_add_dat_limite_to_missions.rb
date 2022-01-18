class AddDatLimiteToMissions < ActiveRecord::Migration[6.1]
  def change
    add_column :missions, :dat_limite, :string
  end
end
