class ChangeDataToTemplateFieldDesign < ActiveRecord::Migration[7.0]
  def change
    change_column :template_field_designs, :x_position, :float
    change_column :template_field_designs, :y_position, :float
    change_column :template_field_designs, :width, :float
    change_column :template_field_designs, :height, :float
  end
end
