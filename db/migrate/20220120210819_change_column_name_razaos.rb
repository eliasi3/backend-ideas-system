class ChangeColumnNameRazaos < ActiveRecord::Migration[6.1]
  def change
    rename_column :razaos, :razao_name, :razao_nome
  end
end
