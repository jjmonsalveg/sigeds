class Cliente < ActiveRecord::Base
  has_many :contactos , dependent: :destroy
end
