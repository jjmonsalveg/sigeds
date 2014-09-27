json.array!(@personals) do |personal|
  json.extract! personal, :id, :nombre, :apellido, :cedula, :direccion, :telefono_casa, :telefono_celular, :sexo, :fecha_nacimiento
  json.url personal_url(personal, format: :json)
end
