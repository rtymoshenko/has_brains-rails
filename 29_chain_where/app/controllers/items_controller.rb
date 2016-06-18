class ItemsController < ApplicationController

  before_filter :find_item, only: [:show, :edit, :update, :destroy, :upvote]
#  before_filter :check_if_admin, only: [:edit, :update, :new, :create, :destroy]
  protect_from_forgery with: :null_session

  # /items GET
  def index
#    @items = Item.all
#    @items = Item.where(price: 1500)
#    @items = Item.where(votes_count: 2, price: 50000)
#    @items = Item.where('votes_count = 2 OR price >= 1500')
#    @items = Item.where("price >= #{params[:price_from]}")
#    @items = Item.where("price >= ?", params[:price_from]).order("votes_count DESC", "price DESC").limit(3)
    @items = Item
    @items = @items.where("price >= ?", params[:price_from])  if params[:price_from] # возвращается обьект ActiveRecordeRelations
    @items = @items.where("created_at >= ?", 1.day.ago)       if params[:today]
    @items = @items.where("votes_count >= ?", params[:votes_count]) if params[:votes_count]
    @items = @items.order("votes_count DESC", "price DESC")
  end

  # /items/ POST глагол кот использует браузер
  def create
    item_params = params.require(:item).permit(:name, :description, :price, :real, :weight)
    p item_params
    @item = Item.create(item_params)
    if @item.errors.empty?
      render 'show'
#      render "new" double render. Only ONE render or redirect is possible
    end
  end

  # /items/1 GET
  def show
    unless @item
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
    item_params = params.require(:item).permit(:name, :description, :price, :real, :weight)
    p item_params
    @item.update_attributes(item_params)
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render "edit"
    end

  end

  # /items/1 DELETE
  def destroy
    @item.destroy
    redirect_to action: "index"
  end

  def upvote
    @item.increment!(:votes_count)
    redirect_to action: :index
  end

  def expensive
    @items  = Item.where("price > 1000")
    render "index"

  end

  private

  def find_item
    @item = Item.where(id: params[:id]).first
    render_404 unless @item
  end

  def tttt

    put "ddddddd"
  end
end
