class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.text :name, null:false
      t.date :birthday
      t.integer :sex, null:false, default: 0
      t.text :tel #電話番号
      t.text :adress #住所
      t.text :mail #メルアド
      t.boolean :magazine, null:false, default: false #メルマガ
      t.string :password #ログインパス
      t.string :user_name, null:false, :unique => true #ログイン用名前
      t.boolean :administrator, null:false, default: false #管理者
      t.boolean :clerk, null:false, default: false
      t.timestamps
    end
    add_column :members, :hashed_password, :string
  end
end
