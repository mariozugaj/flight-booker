class AddPriceToFlights < ActiveRecord::Migration[5.0]
  def change
    add_column :flights, :price, :integer
  end
end
