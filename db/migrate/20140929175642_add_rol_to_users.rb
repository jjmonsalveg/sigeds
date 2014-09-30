class AddRolToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rol,  :integer, default: 0
  end
end
