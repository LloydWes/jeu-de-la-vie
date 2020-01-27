require 'grid_abstraction'

class LifeGameGrid < GridAbstraction
  attr_accessor :none, :cells_buffer

  def initialize(e_width, e_height)
    super(e_width, e_height)
    @cells_buffer = Array.new
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
      if cell.get_content(:type) == :cell
        adjacent_cells << cell if cell != nil
      end
    end
    adjacent_cells
  end

  def get_adjacent_cells_count(x,y) #
    get_adjacent_cells(x,y).length
  end

  def mark_for_deletion(x,y) #
    # if cell_does_exist(x,y)
    #   @cells_buffer << Cell.new(x,y, {type: :none, changes: 1})
    # end
    cell = find_cell(x,y)
    if cell != nil
      cell.set_content(:will_be, 'dead')
      cell.set_content(:changes, 1)
      true
    else
      false
    end
  end

  def mark_for_birth(x,y) #
    # if cell_doesnt_exist(x,y)
    #   @cells_buffer << Cell.new(x,y, {type: :cell, changes: 1})
    # end
    if cell_doesnt_exist(x,y)
      add_cell(x,y, {will_be: 'cell', changes: 1})
      true
    else
      false
    end
  end

  def apply_changes() #
    # puts '-'*20
    # @cells.each do |cell|
    #   puts cell.inspect
    # end
    # puts '-'*20
    @cells.each do |cell|
      if cell.has_content(:changes)
        cell.set_content(:changes, (cell.get_content(:changes) - 1))
        if cell.get_content(:changes) == 0
          cell.remove_content(:changes)
          cont = cell.get_content(:will_be)
          case cont
          when 'dead'
            # puts "----X #{cell.inspect}"
            remove_cell(cell.x, cell.y)
          when 'cell'
            # puts "----V #{cell.inspect}"
            cell.set_content(:type, 'cell')
          end
          cell.remove_content(:will_be)
        end
      end
    end
    # puts '-'*20
    # @cells.each do |cell|
    #   puts cell.inspect
    # end
    # puts '-'*20
  end

end

