class AddReferenceToUsers < ActiveRecord::Migration
  def change
    add_column    :users, :personal_id, :integer
    change_column :users, :personal_id, :integer ,null: false
    add_index     :users, :personal_id, unique: true
  end
end
