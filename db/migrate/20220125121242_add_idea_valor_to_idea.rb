class AddIdeaValorToIdea < ActiveRecord::Migration[6.1]
  def change
    add_column :ideas, :idea_valor, :string
  end
end
