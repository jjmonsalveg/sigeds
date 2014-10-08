class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :direccion
      t.string :direccionFiscal
      t.string :fax
      t.string :nombre
      t.string :rif
      t.string :url

      t.timestamps
    end
  end
end
