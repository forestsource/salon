class CreateOpens < ActiveRecord::Migration
  def change
    create_table :opens do |t|
      t.text :time
      t.timestamps
    end
  end
end
