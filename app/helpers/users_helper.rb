# encoding: UTF-8
module UsersHelper
  def gravatar_for (user, options= {size: 80} )
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.email, class: "gravatar")
  end

  def rol_to_s (rol)
    case rol
      when 'gerente_ds' then 'Gerente Ds'
      when 'asistente_administracion'then  'Asistente de Administracion'
      when 'basico' then 'Básico'
      when 'lider' then 'lider'
      when 'analista' then 'Analista'
      when 'designer' then 'Diseñador'
      when 'programador' then 'Programador'
      when 'tester' then 'Gestor de pruebas'
      else 'error en rol'
    end
  end

  def get_key (hash ,value)
    hash.key(value)
  end
end
