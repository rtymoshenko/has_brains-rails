class Item < ActiveRecord::Base

  # это метод класса
  # validates :price, { numericality: { greater_than: 0, allow_nil: true } }
  validates :price, numericality: { greater_than: 0, allow_nil: true }
  validates :name, :description, presence: true
end
