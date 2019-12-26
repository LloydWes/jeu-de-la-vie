require 'cell'

class GridAbstraction
	attr_accessor :cells, :height_limit, :width_limit

  def initialize(e_width, e_height)
    @width_limit = e_width
    @height_limit = e_height

    @cells = Array.new()
  end

  def height_limit=(e_height)
    if e_height > 0
      @height_limit = e_height
    else 
      @height_limit = 0
    end
  end

  def width_limit=(e_width)
    if e_width > 0
      @width_limit = e_width
    else
      @width_limit = 0
    end
  end

  def each()
    @cells.each do |cell|
      yield cell
    end
  end

  def within_limits(x,y)
    x < @width_limit && y < @height_limit
  end

  def cell_does_exist(x,y)
    find_cell(x,y)
  end

  def cell_doesnt_exist(x,y)
    !find_cell(x,y)
  end

  def add_cell(x, y, content)
    if(within_limits(x,y) && cell_doesnt_exist(x,y))
      @cells << Cell.new(x, y)
    else
      nil
    end
  end

  def find_cell(x, y)
    @cells.find { |cell| (cell.x == x && cell.y == y) }
  end

  def remove_cell(x, y)
    cell_to_remove = find_cell(x, y)
    if cell_to_remove != nil
      @cells.delete( cell_to_remove )
    else
      nil
    end
  end

  def get_grid_size()
    @cells.length
  end

  def get_min(axis)
    @cells.min_by {|cell| cell.send(axis.to_sym)}
  end

  def get_max(axis)
    @cells.max_by {|cell| cell.send(axis.to_sym)}
  end

  def min_x()
    get_min(:x).x
  end

  def max_x()
    get_max(:x).x
  end

  def min_y()
    get_min(:y).y
  end

  def max_y()
    get_max(:y).y
  end

end


