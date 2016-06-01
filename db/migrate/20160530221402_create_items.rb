class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :url_picture
      t.text :description
      t.string :category
      t.string :location
      t.string :status
      t.string :posted_by
      t.string :joy_level

      t.timestamps

    end
  end
end
