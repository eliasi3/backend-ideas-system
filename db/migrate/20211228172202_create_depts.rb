class CreateDepts < ActiveRecord::Migration[6.1]
  def change
    create_table :depts do |t|
      t.string :dep_name

      t.timestamps
    end
  end
end
