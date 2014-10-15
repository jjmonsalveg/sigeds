# encoding: UTF-8
include RegexHelper
class Contacto < ActiveRecord::Base
  belongs_to :cliente, inverse_of: :contactos

  #validates
  validates :nombre , presence: { message: 'es requerido'},
            format: {with: SOLO_CARACTERES_REGEX,
                     message: 'Sólo caracteres A-Z' },
            :length => { :in => 2..50,
                         message: 'debe contener entre 2 y 50 caracteres'}

  validates :cliente_id ,
            presence:{message: 'Error contacto debe estar asociado a algún cliente'},
            :on => :create

  validates :telefonoCelular, presence: { message: ' es requerido'},
            format: { with:TELEFONO_REGEX,
                      message: 'no cumple con formato de Numero Teléfonico' },
            :length => { :maximum => 20,message: 'con demasiados dígitos' }

  validates :telefonoOficina , presence: { message: 'es requerido'},
            format: { with:TELEFONO_REGEX,
                      message: 'no cumple con formato de Número Télefonico' },
            :length => { :maximum => 20,message: 'con demasiados digitos' }

  validates :email , presence: true, format: {with: VALID_EMAIL_REGEX,
                                              message:'no es válido' }
  validates_uniqueness_of :email, scope: :cliente_id,
                          message: 'tomado por un contacto de este cliente'
end
