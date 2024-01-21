class AddNonNullConstraintsToBooks < ActiveRecord::Migration[6.0]
  def change
  	change_column_null :books, :author, false
  	change_column_null :books, :published_year, false
  	change_column_null :books, :isbn_number, false
  end
end
