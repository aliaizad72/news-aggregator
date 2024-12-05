class Category < ApplicationRecord
  has_many :publishers
  has_many :articles

  validates :name, uniqueness: :true, presence: true
end
