class CreateNearestStations < ActiveRecord::Migration[6.1]
  def change
    create_table :nearest_stations do |t|
      t.string :line
      t.string :station
      t.string :time

      t.timestamps
    end
  end
end
