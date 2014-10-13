# encoding: UTF-8
include RegexHelper
class Personal < ActiveRecord::Base
  #asociations
  has_one :user , dependent: :destroy

  #actions
  before_save {
    self.nombre = nombre.mb_chars.downcase.titleize.to_s
    self.apellido = apellido.mb_chars.downcase.titleize.to_s
    self.cedula.gsub!('.','')
    cedula.upcase!
  }

  #validates
  validates :nombre , presence: { message: 'es requerido'},
            format: {with:SOLO_CARACTERES_REGEX,
            message: 'Sólo caracteres A-Z' },
            :length => { :in => 2..20,
            message: 'debe contener entre 2 y 50 caracteres'}

  validates :apellido , presence: { message: 'es requerido'},
            format: { with:SOLO_CARACTERES_REGEX,
            message: 'Sólo caracteres A-Z' },
            :length => { :in => 2..20,
                         message: 'debe contener entre 2 y 50 caracteres'}

  validates :cedula , presence: { message: ' es requerida'},
            uniqueness: {message: 'registrada en sistema'},
            format: { with:CEDULA_REGEX, message: 'no cumple con formato' },
            :length => { :maximum => 15,message: 'con demasiados dígitos' }

  validates :direccion , presence: { message: 'es requerido'},
            :length => { :maximum => 50,message: 'con demasiados caracteres' }

  validates :telefono_casa , presence: { message: ' es requerido'},
            format: { with:TELEFONO_REGEX,
            message: 'no cumple con formato de Numero Teléfonico' },
            :length => { :maximum => 20,message: 'con demasiados dígitos' }

  validates :telefono_celular , presence: { message: 'es requerido'},
            format: { with:TELEFONO_REGEX,
            message: 'no cumple con formato de Número Télefonico' },
            :length => { :maximum => 20,message: 'con demasiados digitos' }

  validates :sexo, presence: { message: 'es requerido'},
            format: { with:SEXO_REGEX, message: 'debe ser M ó F' }

  validates :fecha_nacimiento , presence: { message: 'es requerido'}

end
