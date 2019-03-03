class Cocktail < ApplicationRecord
	has_many :doses, dependent: :destroy
	has_many :ingredients, through: :doses
	mount_uploader :photo, PhotoUploader
	validates :name, uniqueness: true
	validates :name, presence: true, allow_blank: false
end

# validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }