class ItemsController < ApplicationController
  # def current_user
  #    @current_user = User.find(current_user)
  #  end
  def index
    @all_items = Item.all
    @items = @all_items.where("posted_by = ?", current_user.id)
  end

  def show
    @item = Item.find(params[:id])
  end


  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.name = params[:name]
    @item.url_picture = params[:url_picture]
    @item.description = params[:description]
    @item.category = params[:category]
    @item.location = params[:location]
    @item.status = params[:status]
    @item.posted_by = current_user.id
    @item.joy_level = params[:joy_level]

    if @item.save
      redirect_to "/items", :notice => "Item created successfully."
    else
      render 'new'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    @item.name = params[:name]
    @item.url_picture = params[:url_picture]
    @item.description = params[:description]
    @item.category = params[:category]
    @item.location = params[:location]
    @item.status = params[:status]
    @item.posted_by = params[:posted_by]
    @item.joy_level = params[:joy_level]
    @item.action_date = params[:action_date]

    if @item.save
      redirect_to "/items", :notice => "Item updated successfully."
    else
      render 'edit'
    end
  end
  def reduce
    @all_items = Item.all
    @items = @all_items.where("posted_by = ?", current_user.id)
    render 'reduce'
  end
  def update_action_date
    @item = Item.find(params[:id])

    @item.name = params[:name]
    @item.url_picture = params[:url_picture]
    @item.description = params[:description]
    @item.category = params[:category]
    @item.location = params[:location]
    @item.status = params[:status]
    @item.posted_by = params[:posted_by]
    @item.joy_level = params[:joy_level]
    @item.action_date = params[:action_date]

    if @item.save
      redirect_to "/reduce", :notice => "Item updated successfully."
    else
      redirect_to "/reduce", :notice => "Item not updated!"
    end
  end


  def destroy
    @item = Item.find(params[:id])

    @item.destroy

    redirect_to "/items", :notice => "Item deleted."
  end
end
