#  definition of our beer class
#  maybe try adding a method here later
class Beer < ApplicationRecord
  # validate our model ~ this is refered to in testing
    validates :brand, presence: true

  def addCustomLabel(label)
    self.image = label
  end

end
