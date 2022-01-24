class RemoveIesStatusFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :ies_status, :varchar
  end
end
