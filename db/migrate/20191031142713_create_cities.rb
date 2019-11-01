class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :city_id
      t.string :name
      t.string :country
      t.string :lat
      t.string :lon

      t.timestamps
    end
  end
end
