require 'grid_abstraction'

class LifeGameGrid < GridAbstraction
  attr_accessor :none

  def initialize(e_width, e_height)
    super(e_width, e_height)

  end

  def get_adjacent_coordinates(x,y)
    first_cell = [x-1, y-1]
    coordinates = Array.new
    3.times do |i| # i --> x
      3.times do |j| # j --> y
        coordinates << [i, j] if i != x || j != y
      end
    end
    coordinates
  end

  def get_adjacent_cells(x,y)
    adjacent_coordinates = get_adjacent_coordinates(x,y)
    adjacent_cells = Array.new
    adjacent_coordinates.each do |coordinate|
      x = coordinate[0]
      y = coordinate[1]
      cell = find_cell(x,y)
      adjacent_cells << cell if cell != nil
    end
    adjacent_cells
  end

  def get_adjacent_cells_count(x,y)
    get_adjacent_cells(x,y).length
  end

  def mark_for_deletion(x,y)
    cell = find_cell(x,y)
    if cell != nil
      cell.add_content(:will_be, 'dead')
      true
    else
      false
    end
  end

  def mark_for_birth(x,y)
    if cell_doesnt_exist(x,y)
      add_cell(x,y, {will_be: 'living'})
      true
    else
      false
    end
  end

end

