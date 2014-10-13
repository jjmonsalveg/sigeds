class AddIndexToClientesRif < ActiveRecord::Migration
  def change
    add_index :clientes , :rif , unique: true
  end
end
