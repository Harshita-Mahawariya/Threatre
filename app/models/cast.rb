class Cast < ApplicationRecord
	include ActiveStorage::Blob::Analyzable
	validates :name, :experience, :number_of_movies, presence: true
	validates :mobile_number, :length => {:is => 10}, numericality: {only_integer: true},presence: true
	has_one_attached :profile_image

	has_many :movies_with_casts ,dependent: :destroy
	has_many :movies, :through => :movies_with_casts

	accepts_nested_attributes_for :movies_with_casts ,allow_destroy: true
end
