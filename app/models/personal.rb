# encoding: UTF-8
class Personal < ActiveRecord::Base
  #asociations
  has_one :user , dependent: :destroy

  #REGEX
  SOLO_CARACTERES_REGEX = /\A([a-z ñáéíóú]{2,})\z/i
  TELEFONO_REGEX = /\A\+?\d{1,3}?[- .]?\(?(?:\d{2,3})\)?[- .]?\d\d\d[- .]?\d\d[- .]?\d\d\z/
  CEDULA_REGEX  = /\A([JGVE][\-])?(([0-9]{1,3}[\.-]?[0-9]{1,3}[\.-]?[0-9]{3})|([0-9]{1,3}[\.-]?[0-9]{3})|([0-9]{3}))\z/i
  SEXO_REGEX = /\A[MF]\z/

  #actions
  before_save {
    self.nombre = nombre.mb_chars.downcase.titleize.to_s
    self.apellido = apellido.mb_chars.downcase.titleize.to_s
    self.cedula.gsub!('.','')
    cedula.upcase!
  }

  #validates
  validates :nombre , presence: { message: "es requerido"},
            format: {with:SOLO_CARACTERES_REGEX, message: "Solo caracteres A-Z" },
            :length => { :in => 2..20, message: "debe contener entre 2 y 50
caracteres"}

  validates :apellido , presence: { message: "son requerido"},
            format: { with:SOLO_CARACTERES_REGEX, message: "Solo caracteres A-Z" },
            :length => { :in => 2..20, message: "debe contener entre 2 y 50
caracteres"}

  validates :cedula , presence: { message: " es requerida"},
            uniqueness: {message: "registrada en sistema"},
            format: { with:CEDULA_REGEX, message: "no cumple con formato" },
            :length => { :maximum => 15,message: "con demasiados digitos" }

  validates :direccion , presence: { message: "es requerido"},
            :length => { :maximum => 50,message: "con demasiados caracteres" }

  validates :telefono_casa , presence: { message: " es requerido"},
            format: { with:TELEFONO_REGEX, message: "no cumple con formato de
 Numero Télefonico" },
            :length => { :maximum => 20,message: "con demasiados digitos" }

  validates :telefono_celular , presence: { message: "es requerido"},
            format: { with:TELEFONO_REGEX, message: "no cumple con formato de
 Numero Télefonico" },
            :length => { :maximum => 20,message: "con demasiados digitos" }

  validates :sexo, presence: { message: "es requerido"},
            format: { with:SEXO_REGEX, message: "debe ser M ó F" }

  validates :fecha_nacimiento , presence: { message: "es requerido"}

end
