class CreateCalRsultYamates < ActiveRecord::Migration[5.2]
  def change
   create_table :cal_result_yamates do |t|
     t.integer :station_group
     t.integer :this_hour
     t.integer :small_delay
     t.integer :huge_delay
     t.integer :this_count

     t.timestamps
   end
  end
end
