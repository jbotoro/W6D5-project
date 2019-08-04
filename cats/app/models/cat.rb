require 'action_view/helpers'

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  
  COLORS = ['orange', 'black', 'white']
  SEX = ['M', 'F']
  validates :color, inclusion: COLORS 
  validates :sex, inclusion:  SEX 
  validates :birth_date, :color, :name, :sex, presence: true
  
  has_many :cat_rental_requests,
  foreign_key: :cat_id,
  class_name: :CatRentalRequest,
  dependent: :destroy
  
  def age
    # debugger
    time_ago_in_words(birth_date)
  end

end