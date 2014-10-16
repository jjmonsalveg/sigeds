class CreateContactos < ActiveRecord::Migration
  def change
    create_table :contactos do |t|
      t.string :email, :limit => 30
      t.string :nombre , :limit => 50
      t.string :telefonoCelular , :limit => 15
      t.string :telefonoOficina , :limit => 15
      t.references :cliente, index: true

      t.timestamps
    end
  end
end
