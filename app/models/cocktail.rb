class Cocktail < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, uniqueness: true, presence: true
  validates :photo, presence: true

  def fake
    a = ["Popular", "Okay", "Oh yeah!"]
    return a.sample
  end


end
