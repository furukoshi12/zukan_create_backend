class AddSizeAndPositionToIllustratedBookFieldDesigns < ActiveRecord::Migration[7.0]
  def change
    add_column :illustrated_book_field_designs, :height, :float
    add_column :illustrated_book_field_designs, :width, :float
    add_column :illustrated_book_field_designs, :x_position, :float
    add_column :illustrated_book_field_designs, :y_position, :float
  end
end
