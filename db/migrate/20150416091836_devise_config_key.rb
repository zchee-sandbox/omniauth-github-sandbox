class DeviseConfigKey < ActiveRecord::Migration
  def change
    change_column_null :users, :email, null: false, default: ""
  end
end
