class User < ApplicationRecord
  has_secure_password
  has_many  :contacts
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :phone, presence: true
end
