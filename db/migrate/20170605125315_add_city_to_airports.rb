class AddCityToAirports < ActiveRecord::Migration[5.0]
  def change
    add_column :airports, :city, :string
  end
end
