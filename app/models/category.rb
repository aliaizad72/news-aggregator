class Category < ApplicationRecord
  belongs_to :language

  has_many :publishers
  has_many :articles

  validates :name, uniqueness: :true, presence: true
end
