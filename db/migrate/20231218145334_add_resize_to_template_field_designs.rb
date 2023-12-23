class AddResizeToTemplateFieldDesigns < ActiveRecord::Migration[7.0]
  def change
    add_column :template_field_designs, :width, :integer
    add_column :template_field_designs, :height, :integer
  end
end
