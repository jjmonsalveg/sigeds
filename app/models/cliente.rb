# encoding: UTF-8
require 'uri'
include RegexHelper
class Cliente < ActiveRecord::Base
  has_many :contactos , dependent: :destroy,inverse_of: :cliente
  has_many :proyectos ,dependent:  :destroy,inverse_of: :cliente

  #actions
  before_save {
    self.nombre = nombre.mb_chars.downcase.titleize.to_s
    url.downcase!
  }

  #validates
  validates :nombre , presence: { message: 'es requerido'},
            format: {with:NOMBRE_REGEX,
                     message: 'Solo caracteres A-Z, Números, puntos y/o comas' },
            :length => { :in => 2..50,
                         message: 'debe contener entre 2 y 50 caracteres'}

  validates :rif , presence: { message: ' es requerido'},
            uniqueness: {message: 'registrada en sistema'},
            format: { with:RIF_REGEX,
                      message: 'no cumple con formato X-XXXXXXXX-X' },
            :length => { :maximum => 15,message: 'con demasiados dígitos' }

  validates :direccion, presence: { message: 'es requerido'},
            :length => { :maximum => 50,message: 'con demasiados caracteres' }

  validates :direccionFiscal, presence: { message: 'es requerido'},
            :length => { :maximum => 50,message: 'con demasiados caracteres' }


  validates :fax , presence: { message: ' es requerido'},
            format: { with:TELEFONO_REGEX,
                      message: 'no cumple con formato de Numero Teléfonico' },
            :length => { :maximum => 20,message: 'con demasiados dígitos' }

  validate  :valida_dominio

  validates :url  , presence:{message: 'es requerido'}

  def valida_dominio
    begin
      uri = URI.parse(url)
      if uri.class == URI::HTTP
        errors.add(:url,'no válida') unless url =~
            /\A#{URI::regexp(%w(http https))}\z/ix
      else
        errors.add(:url,'no válida') unless ('http://'<<url) =~
            /\A#{URI::regexp(%w(http https ))}\z/ix
      end

    rescue URI::InvalidURIError
      errors.add(:url, 'con formato no válido')
    end
  end
end
