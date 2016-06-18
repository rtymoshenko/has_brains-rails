class ItemsController < ApplicationController
# метод выполняет поиск товаров кот. были созданы и будет выводить из БД
  def index
    # all - ActiveRecord метод, доступный всем классам наслед и он сделает запрос в БД и инициализирует обьект для каждой
    # записи и вернет массив обьектов
    @items = Item.all
    render text: @items.map { |i| "#{i.name}: #{i.price}" }.join("</br>")
  end

  def create
    #p params
    # render text: "item created"
    #@item = Item.create(name: params[:name], description: params[:description],
    #price: params[:price], real: params[:real], weight: params[:weight])
    # @item = Item.create(params[:item])

    item_params = params.require(:item).permit(:name, :description) # item это подхеш,
    # для того чтобы в рейлс уменьшить к-во параметров, эта строка для того чтобы разрешить использовать подхеш item
    p params
    @item = Item.create(item_params)
    puts "item_params"
    p item_params
    render text: "#{@item.id}: #{@item.name} (#{!@item.new_record?})"

  end

end
