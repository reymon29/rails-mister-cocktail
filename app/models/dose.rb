class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail
  validates :cocktail, :ingredient, presence: true
  validates :cocktail, uniqueness: { scope: :ingredient}
end