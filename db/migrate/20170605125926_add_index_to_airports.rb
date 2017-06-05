class AddIndexToAirports < ActiveRecord::Migration[5.0]
  def change
    remove_index :airports, :code
    add_index :airports, [:code, :city]
  end
end
