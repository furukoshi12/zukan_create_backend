class IllustratedBook < ApplicationRecord
  after_initialize :set_default_template

  mount_uploader :image, ImageUploader

  belongs_to :user, optional: true
  belongs_to :template, class_name: 'Template'
  has_many :likes, dependent: :destroy
  has_many :illustrated_book_tags, dependent: :destroy
  has_many :tags, through: :illustrated_book_tags
  has_many :illustrated_book_field_designs, dependent: :destroy
  has_many :field_designs, through: :illustrated_book_field_designs

  accepts_nested_attributes_for :illustrated_book_field_designs

  def create_tags(tags)
    (tags || []).each do |name|
      tag = Tag.find_or_create_by(name: name)
      self.tags << tag
    end
  end

  
  def update_tags(latest_tags)
    current_tags = self.tags.pluck(:name)
  
    return if current_tags.sort == latest_tags.sort
  
    if self.tags.empty?
      latest_tags.each do |latest_tag|
        return if latest_tag.length == 0
        self.tags << Tag.find_or_create_by(name: latest_tag)
      end
    elsif latest_tags.empty?
      self.tags.clear
    else
      old_tags = current_tags - latest_tags
      new_tags = latest_tags - current_tags
  
      old_tags.each do |old_tag|
        tag = self.tags.find_by(name: old_tag)
        self.tags.delete(tag) if tag
      end
  
      new_tags.each do |new_tag|
        self.tags << Tag.find_or_create_by(name: new_tag)
      end
    end
  end
  
  private

  def set_default_template
    self.template_id ||= 1
  end
end
