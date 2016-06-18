class Item < ActiveRecord::Base

# это метод класса
# validates :price, { numericality: { greater_than: 0, allow_nil: true } }
 #  validates :price, numericality: { greater_than: 0, allow_nil: true }
  validates :name, :description, presence: true

# callback - это спец методы кот. позволяют выполнять определенный код в ответ на событие кот. произошли с нашей моделью
#  after_initialize { puts "initialized"} # Item.new; Item.first
#  after_save       { puts "saved" } # Item.save; Item.create; item.update_attributes()
#  after_create     { ItemMailer.new_item_created(self).deliver }
#  after_create     { puts "created" }
#  after_update     { puts "udpated" }
#  after_destroy    { puts "destroyed" } # item.destroy


#  belongs_to :category
#  after_create     { category.inc(:items_count, 1) } category метод кот возвр. обьект класса Category
#  after_destroy    { category.inc(:items_count, -1) }
  has_many :positions
  has_many :carts, through: :positions
end
