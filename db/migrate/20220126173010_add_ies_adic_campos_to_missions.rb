class AddIesAdicCamposToMissions < ActiveRecord::Migration[6.1]
  def change
    add_column :missions, :ies_adic_campos, :string
  end
end
