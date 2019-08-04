class CatRentalRequest < ApplicationRecord
STATUS = ['APPROVED', 'PENDING', 'DENIED']

validates :cat_id, :start_date, :end_date, :status, presence: true
validates :status, inclusion: STATUS

belongs_to :cat,
foreign_key: :cat_id,
class_name: :Cat

    def overlapping_requests

        CatRentalRequest
            .where.not(id: self.id)
            .where(cat_id: cat_id)
            .where.not('start_date > :end_date OR end_date < :start_date', 
                        start_date: start_date, end_date: end_date)

    end

    def overlapping__approved_requests
        overlapping_requests.where("status = 'APPROVED' ")
    end

    def overlapping__pending_requests
        overlapping_requests.where("status = 'PENDING' ")
    end

    def does_not_overlap_approved_request
        overlapping__approved_requests.exists?
    end

end
