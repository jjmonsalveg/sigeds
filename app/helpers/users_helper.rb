# encoding: UTF-8
module UsersHelper
  def gravatar_for (user, options= {size: 80} )
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.email, class: "gravatar")
  end

  def get_rol (user)
    if user.gerente_ds?
      "Gerente Ds"
    elsif user.basico?
      "Básico"
    end

  end
end
