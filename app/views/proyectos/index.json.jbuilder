json.array!(@proyectos) do |proyecto|
  json.extract! proyecto, :id, :fecha_inicio, :fecha_fin, :cliente_id, :nombre
  json.url proyecto_url(proyecto, format: :json)
end
