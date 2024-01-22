class AddAuthorReferencesToBooks < ActiveRecord::Migration[6.0]
  def change
  	add_reference :books, :author, index: true
  end
end
