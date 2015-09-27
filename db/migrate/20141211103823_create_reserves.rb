# coding: utf-8
class CreateReserves < ActiveRecord::Migration
  def change
    create_table :reserves do |t|
      t.integer :id, null: false          # 予約ID
      t.references :menu, null: false     # メニューID
      t.references :staff, null: false    # スタッフID　
      t.date :day, null: false      # 日にち
      t.integer :open_id, null: false
      t.references :member, null: false     # 予約者ID
      t.timestamps
    end
  end
end
