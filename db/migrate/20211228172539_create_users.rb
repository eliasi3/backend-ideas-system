class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :user_name
      t.string :email
      t.string :password_digest
      t.string :user_phone
      t.references :dept, null: false, foreign_key: true

      t.timestamps
    end
  end
end
