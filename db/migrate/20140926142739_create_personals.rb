class CreatePersonals < ActiveRecord::Migration
  def change
    create_table :personals do |t|
      t.string :nombre , :limit => 50
      t.string :apellido , :limit => 50
      t.string :cedula  , :limit => 15
      t.string :direccion , :limit => 50
      t.string :telefono_casa , :limit => 15
      t.string :telefono_celular , :limit => 30
      t.string :sexo , :limit => 1
      t.date :fecha_nacimiento

      t.timestamps
    end
  end
end
