class AddIesAtivoToMissions < ActiveRecord::Migration[6.1]
  def change
    add_column :missions, :ies_ativo, :integer
  end
end
