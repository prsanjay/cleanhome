class CreateCityCleaners < ActiveRecord::Migration
  def change
    create_table :city_cleaners do |t|
      t.integer :city_id
      t.integer :cleaner_id

      t.timestamps null: false
    end
  end
end
