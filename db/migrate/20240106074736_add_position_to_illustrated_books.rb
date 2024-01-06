class AddPositionToIllustratedBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :illustrated_books, :image_x_position, :float
    add_column :illustrated_books, :image_y_position, :float
  end
end
