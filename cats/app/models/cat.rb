require 'action_view/helpers'

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  
  COLORS = ['orange', 'black', 'white']
  SEX = ['M', 'F']
  validates :color, inclusion: { in: COLORS }
  validates :sex, inclusion: { in: SEX }
  def age
    # debugger
    time_ago_in_words(birth_date)
  end

end