class CreateContactos < ActiveRecord::Migration
  def change
    create_table :contactos do |t|
      t.string :email
      t.string :nombre
      t.string :telefonoCelular
      t.string :telefonoOficina
      t.references :cliente, index: true

      t.timestamps
    end
  end
end
