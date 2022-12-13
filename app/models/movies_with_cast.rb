class MoviesWithCast < ApplicationRecord
	belongs_to :movie
	belongs_to :cast
	validates :movie_id, uniqueness: { scope: :cast_id}
end
