class CreateCampos < ActiveRecord::Migration[6.1]
  def change
    create_table :campos do |t|
      t.string :cam_nome
      t.string :cam_tipo
      t.string :ies_ordem
      t.string :ies_obrigatorio
      t.references :mission, null: false, foreign_key: true

      t.timestamps
    end
  end
end
