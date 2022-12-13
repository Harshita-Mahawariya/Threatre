class ProductionCompanySerializer < ActiveModel::Serializer
	attributes :id,:name, :turnover
	
	# def movie
  #   ActiveModel::SerializableResource.new(object.movie,  each_serializer: MovieSerializer)
	# end

end