# encoding: UTF-8
include RegexHelper
class Proyecto < ActiveRecord::Base
  #asociations
  belongs_to :cliente ,  inverse_of: :proyectos

  #validates
  validates :fecha_inicio , presence: { message: 'es requerido'}
  validates :fecha_fin    , presence: { message: 'es requerido'}
  validates :cliente_id   , presence: { message: 'debe ser asociado a Proyecto'}
  validates :nombre , presence: { message: 'es requerido'},
            format: {with:NOMBRE_REGEX,
                     message: 'Solo caracteres A-Z, Números, puntos y/o comas' },
            :length => { :in => 4..50,
                         message: 'debe contener entre 4 y 50 caracteres'}
  validate  :validacion_fecha

  def validacion_fecha
    return if self.fecha_fin.blank? || self.fecha_inicio.blank?

    if self.fecha_inicio >= self.fecha_fin
      errors.add(:fecha_fin, 'debe ser mayor que Fecha Inicio')
    end
  end
end
