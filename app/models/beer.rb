#  definition of our beer class
#  maybe try adding a method here later
class Beer < ApplicationRecord
  # validate our model ~ this is refered to in testing
    validates :brand, presence: true
end
