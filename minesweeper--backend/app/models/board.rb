class Board < ApplicationRecord
  serialize :field

  def field_generator
    height.times{
      row =[]
      width.times{
        row << [false, true].sample
      }
      field << row
    }
  end

end
