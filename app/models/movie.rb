class Movie < ApplicationRecord
	validates :name, :duration, presence: true
	validates :budget, numericality: {only_integer: true}, presence: true
	has_one_attached :poster
	belongs_to :production_company

	has_many :movies_with_casts ,dependent: :destroy
	has_many :casts, :through => :movies_with_casts

	accepts_nested_attributes_for :movies_with_casts ,allow_destroy: true
	accepts_nested_attributes_for :casts, allow_destroy: true
end
