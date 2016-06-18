# RESTful контроллер является ресуром, RESTful - Representation State Transfer
# любой ресурс имеет екшены кот отвечают за манипуляцию ресурсом create, read, update, destroy
# метод edit будет рендерить форму, кот будет отправляться в метов update, метод new будет рендерить форму, кот будет
# отправляться в метод сreate, это вспомагательные методы
class ItemsController < ApplicationController
    protect_from_forgery with: :null_session
# метод выполняет поиск товаров кот. были созданы и будет выводить из БД
  # /items GET
  def index
    # all - ActiveRecord метод, доступный всем классам наслед и он сделает запрос в БД и инициализирует обьект для каждой
    # записи и вернет массив обьектов
    @items = Item.all
    render text: @items.map { |i| "#{i.name}: #{i.price}" }.join("</br>")
  end

  # /items/ POST глагол кот использует браузер
  def create
    #p params
    # render text: "item created"
    #@item = Item.create(name: params[:name], description: params[:description],
    #price: params[:price], real: params[:real], weight: params[:weight])
    # @item = Item.create(params[:item])
    p params
    item_params = params.require(:item).permit(:name, :description) # item это подхеш,
    # для того чтобы в рейлс уменьшить к-во параметров, эта строка для того чтобы разрешить использовать подхеш item
    p params
    params = "tttt"
    @item = Item.create(item_params)
    puts "item_params"
    p item_params
    render text: "#{@item.id}: #{@item.name} (#{!@item.new_record?})"
  end

  # /items/1 GET
  def show

  end

  # /items/new GET
  def new

  end

  # /items/1/edit GET
  def edit

  end

  # /items/1 PUT
  def update

  end

  # /items/1 DELETE
  def destroy

  end

end
