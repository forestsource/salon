# coding: utf-8 
class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :category_name, null: false   # カテゴリ名
    end
  end
end
