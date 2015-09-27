class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :menu_name, null: false
      t.integer :menu_time, null: false
      t.integer :price, null: false
      t.references :category, null: false
      t.timestamps
    end
  end
end
