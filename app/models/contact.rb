class Contact < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :phone, presence: true, uniqueness: true
  validates :address, presence: true
end
