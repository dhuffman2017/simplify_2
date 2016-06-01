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
  def donate
  render 'donate'
  end
  def trash
    render 'trash'
  end
  def sell
  end
end
