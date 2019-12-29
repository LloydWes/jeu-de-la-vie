require 'grid_abstraction'

class LifeGameGrid < GridAbstraction
  attr_accessor :none

  def initialize(e_width, e_height)
    super(e_width, e_height)
  end

  def get_adjacent_coordinates(x,y) #
    first_cell = [x-1, y-1]
    coordinates = Array.new
    ((y-1)..(y+1)).each do |j| # j --> y
      ((x-1)..(x+1)).each do |i| # i --> x
        coordinates << [i, j] if i != x || j != y
      end
    end
    coordinates
  end

  def get_adjacent_cells(x,y) #
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

  def apply_changes()
    @cells.each do |cell|
      puts cell.inspect
      cell.apply_changes()
      if cell.get_content(:type) == 'none'
        puts "X removed #{cell.inspect}"
        remove_cell(cell.x, cell.y)
      end
    end
  end

  def get_adjacent_cells_count(x,y) #
    # puts "[#{x},#{y}] : #{get_adjacent_cells(x,y).length}" if x == 3 && y == 3
    get_adjacent_cells(x,y).length
  end

  def mark_for_deletion(x,y) #
    cell = find_cell(x,y)
    if cell != nil
      cell.add_content(:will_be, 'dead')
      cell.add_content(:changes, 1)
      true
    else
      false
    end
  end

  def mark_for_birth(x,y) #
    if cell_doesnt_exist(x,y)
      add_cell(x,y, {will_be: 'cell', changes: 1})
      true
    else
      false
    end
  end


end

