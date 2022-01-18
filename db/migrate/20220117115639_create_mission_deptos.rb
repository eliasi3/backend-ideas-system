class CreateMissionDeptos < ActiveRecord::Migration[6.1]
  def change
    create_table :mission_deptos do |t|
      t.references :mission, null: false, foreign_key: true
      t.references :dept, null: false, foreign_key: true

      t.timestamps
    end
  end
end
