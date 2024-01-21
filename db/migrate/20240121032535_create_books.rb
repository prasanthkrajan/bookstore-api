class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author
      t.integer :published_year
      t.string :isbn_number, unique: true, index: true
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
