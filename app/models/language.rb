require "iso-639"

class Language < ApplicationRecord
  has_many :categories
  has_many :publishers
  has_many :articles

  validate :valid_lang_code

  validates :code, presence: true, uniqueness: true

  def valid_lang_code
    if ISO_639.find(code).nil?
      errors.add :code, :not_a_code, message: "Param code is not a valid ISO 639-1 code!"
    end
  end
end
