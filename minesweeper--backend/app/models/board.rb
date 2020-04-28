class Board < ApplicationRecord

  def field_generator
    height.times{
      row =[]
      width.times{
        row << [" ", "x"].sample
      }
      field << row
    }
  end

  # simple accesor to the field
  def [](x, y)
    field[y][x]
  end

  def neighbors(x, y)
    [ [-1, -1],[0,-1],[1,-1],
      [-1,  0],       [1, 0],
      [-1,  1],[0, 1],[1, 1] ].map { |x_off, y_off|

      neighbor_x = x + x_off
      neighbor_y = y + y_off

      if neighbor_x.between?(0, width - 1) && neighbor_y.between?(0, height - 1)
        self[neighbor_x, neighbor_y]
      else
        nil
      end
    }.compact
  end

  def how_many_bombs_around?(x, y)
    neighbors(x, y).count { |tile| tile.eql?("x") }
  end

  # retuns a new board with the amount of bombs arround each tile
  # -1 on the field represents a bomb on that tile
  def all_bombs
    Array.new(height) { |y|
      Array.new(width) { |x|
        if self[x,y].eql?("x")
          -1
        else
          how_many_bombs_around?(x, y)
        end
      }
    }
  end

  def is_a_mine?(x,y)
    self[x,y].eql?("x")
  end

end
