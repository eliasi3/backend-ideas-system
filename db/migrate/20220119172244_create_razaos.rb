class CreateRazaos < ActiveRecord::Migration[6.1]
  def change
    create_table :razaos do |t|
      t.string :razao_name
      t.text :razao_desc
      t.string :ies_status

      t.timestamps
    end
  end
end
