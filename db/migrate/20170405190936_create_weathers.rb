class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.float :min_temperature
	  t.float :max_temperature
	  t.datetime :date_time  
      t.timestamps null: false
    end
  end
end
