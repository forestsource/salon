class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.references :member, null: false
      t.references :category, null: false
      t.text :intro_myself, null: false
      t.text :interest, null: false
      t.text :staff_image, null: false
      t.timestamps
    end
  end
end
