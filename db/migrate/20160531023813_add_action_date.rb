class AddActionDate < ActiveRecord::Migration
  def change
    add_column :items, :action_date, :date
  end
end
