class Category < ApplicationRecord
  has_many :publishers

  validates :name, uniqueness: :true, presence: true
end
