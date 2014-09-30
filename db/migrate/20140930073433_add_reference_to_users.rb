class AddReferenceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :personal_id, :integer, default: nil
    add_index  :users , :personal_id, unique: true
  end
end
