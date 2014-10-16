class CreateProyectos < ActiveRecord::Migration
  def change
    create_table :proyectos do |t|
      t.date :fecha_inicio
      t.date :fecha_fin
      t.references :cliente, index: true
      t.string :nombre , :limit => 50

      t.timestamps
    end
  end
end
