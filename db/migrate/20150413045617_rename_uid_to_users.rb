class RenameUidToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :uid, :name
  end
end
