# coding: utf-8
class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.integer :id, null: false          # シフトID
      t.integer :staff_id, null: false    # スタッフID
      t.date :day, null: false            #出勤日
      t.integer :going_time, null: false, default: 1         # 出勤時間
      t.integer :leave_time, null: false, default: 21       # 退勤時間

      t.timestamps
    end
    add_index :shifts,:day
  end
end
