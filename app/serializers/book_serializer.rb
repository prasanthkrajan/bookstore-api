class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :published_year, :isbn_number, :price

  def author
  	object.author.attributes.except('created_at', 'updated_at')
  end
end
