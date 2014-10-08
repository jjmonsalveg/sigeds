json.array!(@contactos) do |contacto|
  json.extract! contacto, :id, :email, :nombre, :telefonoCelular, :telefonoOficina, :cliente_id
  json.url contacto_url(contacto, format: :json)
end
