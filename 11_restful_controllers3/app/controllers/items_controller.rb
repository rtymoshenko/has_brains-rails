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
#    render text: @items.map { |i| "#{i.name}: #{i.price}" }.join("</br>")
  end

  # /items/ POST глагол кот использует браузер
  def create
    item_params = params.require(:item).permit(:name, :description, :price, :real, :weight)
 #   render text: params.inspect
    p item_params
    @item = Item.create(item_params)
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render "new"
    end
  end

  # /items/1 GET
  def show
#    if @item = Item.where({id: params[:id]}).first # cоздаем запрос и отправляем с помощью first в БД
#      render "items/show" # если не использовать render метод то будет использ автоматич. метод show из папки items
#    else
#      render :text => "Page not found", status: 404
#    end
    unless @item = Item.where({id: params[:id]}).first
      render text: "Page not found", status: 404
    end

  end

  # /items/new GET
  def new
    @item = Item.new

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
