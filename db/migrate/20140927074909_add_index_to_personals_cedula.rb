class AddIndexToPersonalsCedula < ActiveRecord::Migration
  def change
    add_index :personals, :cedula , unique: true
  end
end
