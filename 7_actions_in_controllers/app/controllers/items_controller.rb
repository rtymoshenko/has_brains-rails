class ItemsController < ApplicationController
# метод выполняет поиск товаров кот. были созданы и будет выводить из БД
  def index
    # all - ActiveRecord метод, доступный всем классам наслед и он сделает запрос в БД и инициализирует обьект для каждой
    # записи и вернет массив обьектов
    @items = Item.all
    render text: @items.map { |i| "#{i.name}: #{i.price}" }.join("</br>")
  end

end
