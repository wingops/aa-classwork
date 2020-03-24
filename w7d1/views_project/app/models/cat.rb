require 'date'

class Cat < ApplicationRecord
  validates :birth_date, :color, :name, presence: true
  validates :sex, presence: true, inclusion: {in: %w(m f mf), message: "%{value} is not a valid sex" }

  def age
    current_age = (Date.today - self.birth_date)/365
    current_age.to_i
  end
end
