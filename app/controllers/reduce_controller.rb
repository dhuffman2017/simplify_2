class ReduceController < ApplicationController
  def index
    @all_items = Item.all
    @items = @all_items.where("posted_by = ?", current_user.id)
  end
  # def calendar
  #   month_calendar do |date|
  #     :start_date
  #   end
  # end
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
      redirect_to "/reduce", :notice => "Item updated successfully."
    else
      render 'index'
    end
  end


  # def action_date
  #   @item = Item.find(params[:id])
  #   # @item.action_date = params[:action_date]
  #
  #   @item.name = params[:name]
  #   @item.url_picture = params[:url_picture]
  #   @item.description = params[:description]
  #   @item.category = params[:category]
  #   @item.location = params[:location]
  #   @item.status = params[:status]
  #   @item.posted_by = params[:posted_by]
  #   @item.joy_level = params[:joy_level]
  #   @item.action_date = params[:action_date]
# if @item.save
#       redirect_to "/reduce", :notice => "Item updated successfully."
#     else
#       redirect_to "/reduce", :notice => "Date not updated!"
#   end
#   @item.save
#   render 'index'
# end
  def donate
    render 'donate'
  end
  def trash
    render 'trash'
  end
  def sell
  end
  def draw
    render 'reduce'
  end
end
