class AddIesAtivoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :ies_ativo, :integer
  end
end
