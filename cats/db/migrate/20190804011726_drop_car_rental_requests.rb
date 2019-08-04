class DropCarRentalRequests < ActiveRecord::Migration[5.2]
  def change
    drop_table :car_rental_requests
  end
end
