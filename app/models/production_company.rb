class ProductionCompany < ApplicationRecord
	validates :name, :turnover, presence: true
	has_one_attached :profile_image
	has_many :movies

	accepts_nested_attributes_for :movies,allow_destroy: true
end
