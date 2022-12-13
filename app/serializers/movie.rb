class MovieSerializer < ActiveModel::Serializer
	attributes :id,:name, :budget, :duration
	
end