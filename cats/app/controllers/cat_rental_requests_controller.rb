class CatRentalRequestsController < ApplicationController


def new
    @rental_request = CatRentalRequest.new
end



private

 def cat_rental_request_params
    params.require(:cat_rental_request).permit(:cat_id, :end_date, :start_date, :status)
 end
end