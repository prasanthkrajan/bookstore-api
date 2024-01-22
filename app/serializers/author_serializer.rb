class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :books
end
