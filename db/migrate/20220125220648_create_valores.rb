class CreateValores < ActiveRecord::Migration[6.1]
  def change
    create_table :valores do |t|
      t.string :val_dec
      t.string :val_cha
      t.string :val_tex
      t.string :val_dat
      t.string :val_fil
      t.references :campos, null: false, foreign_key: true
      t.references :ideas, null: false, foreign_key: true

      t.timestamps
    end
  end
end
