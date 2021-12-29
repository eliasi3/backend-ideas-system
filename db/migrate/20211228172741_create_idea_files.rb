class CreateIdeaFiles < ActiveRecord::Migration[6.1]
  def change
    create_table :idea_files do |t|
      t.string :idea_file
      t.references :idea, null: false, foreign_key: true

      t.timestamps
    end
  end
end
