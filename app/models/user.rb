# encoding: UTF-8
include RegexHelper
class User < ActiveRecord::Base
  attr_accessor :remember_token
  #asociations
  belongs_to :personal
  accepts_nested_attributes_for :personal
  #rols
  enum rol: [:basico, :gerente_ds, :asistente_administracion,:lider,
             :analista, :designer,:programador,:tester]

  before_save  { self.email = email.downcase }

  #encrypt
  has_secure_password

  #validates
  validates :email , presence: true, format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false,
            message:'email corresponde a un usuario'}

  validates :personal_id ,presence:{message: 'debe asociarse a este usuario'},
            uniqueness: {message: 'Este empleado ya tiene usuario'}

  validates :password,
            length: { minimum: 6, message:'debe ser mayor de 5 caracteres' },
            allow_blank: true

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end


end
