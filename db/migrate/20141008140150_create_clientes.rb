class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :direccion , :limit => 50
      t.string :direccionFiscal , :limit => 50
      t.string :fax , :limit => 15
      t.string :nombre , :limit => 50
      t.string :rif , :limit => 50
      t.string :url , :limit => 50

      t.timestamps
    end
  end
end
