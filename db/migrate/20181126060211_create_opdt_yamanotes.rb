class CreateOpdtYamanotes < ActiveRecord::Migration[5.2]
  def change
    create_table :opdt_yamanotes do |t|
      t.string :o_id
      t.string :o_type
      t.datetime :date
      t.string :context
      t.datetime :o_valid
      t.integer :delay
      t.integer :opdt_index
      t.string :same_as
      t.string :railway
      t.string :operator
      t.string :to_station
      t.string :train_type
      t.string :from_station
      t.string :train_number
      t.string :direction
      t.integer :composition
      t.string :destinantion_station

      t.timestamps
    end
  end
end
