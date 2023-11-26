class AddColumnToIllustratedBook < ActiveRecord::Migration[7.0]
  def change
    add_reference :illustrated_books, :template, null: false, foreign_key: true
    add_column :illustrated_books, :image, :string
  end
end
