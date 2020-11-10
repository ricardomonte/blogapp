class User < ApplicationRecord
  before_save {self.email = email.downcase }
  has_many :articles
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: { minimum: 3, maximum: 25 }
  validates :email, presence: true, uniqueness: {case_sensitive: false}, length: { maximum: 105}, format: { with: VALID_EMAIL_REGEX }
# valida que este presente, que sea unico, un minimo y maximo en la longintud para el username
# valida que este presente, que sea unico, un maximo de longitud y que sea un email valido por medio de un formato especific REGEX
end
