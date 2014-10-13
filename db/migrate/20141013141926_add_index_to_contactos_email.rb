class AddIndexToContactosEmail < ActiveRecord::Migration
  def change
    add_index :contactos , :email
  end
end
