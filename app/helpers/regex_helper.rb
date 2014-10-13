# encoding: UTF-8
module RegexHelper
  NOMBRE_CLIENTE_REGEX = /\A([a-z ñáéíóú 0-9 \. \- ,]{2,})\z/i
  TELEFONO_REGEX = /\A\+?\d{1,3}?[-.]?\(?(?:\d{2,3})\)?[-.]?\d\d\d[-.]?\d\d[-.]?\d\d\z/
  RIF_REGEX  = /\A([JGVE][\-])(([0-9]{1,3}[0-9]{1,3}[0-9]{3})|([0-9]{1,3}[0-9]{3})|([0-9]{3}))\-[0-9]{1}\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  SOLO_CARACTERES_REGEX = /\A([a-z ñáéíóú]{2,})\z/i
  CEDULA_REGEX  = /\A([JGVE][\-])?(([0-9]{1,3}[\.]?[0-9]{1,3}[\.]?[0-9]{3})|([0-9]{1,3}[\.]?[0-9]{3})|([0-9]{3}))\z/i
  SEXO_REGEX = /\A[MF]\z/
end