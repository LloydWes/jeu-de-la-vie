require 'pry'

class Ruler

  attr_reader :update

  def initialize()
    @update = Proc.new() {} #useless
  end

  def set_update(&block) # useless
    if block.is_a?(Proc)
      @update = block
      true
    else
      false
    end
  end

  def get_update() # useless
    @update
  end

  def flatten_coordinates(mess)
    final_fucking_coordinates = Array.new
    mess.each do |less_mess|
      # less_mess = [[0,0], [0,1], [0,3], [0,2], [0,4]]
      less_mess.each do |coor|
        final_fucking_coordinates << coor
      end
    end
    final_fucking_coordinates
  end

  def play_turn(grid)
    # puts "Play turn"
    surroundings = Array.new
    changed_obj = Array.new
    puts "X"
    grid.each do |cell|
      x = cell.x
      y = cell.y
      surroundings << grid.get_adjacent_coordinates(x,y) #[[0,0], [0,1], [0,2], [0,3], [0,4]]
      adjacent_cells_count = grid.get_adjacent_cells_count(x,y)
      # binding.pry
      # binding.pry if x==3 && y==3
      if adjacent_cells_count < 2 || adjacent_cells_count > 3
        grid.mark_for_deletion(x,y)
        puts "[#{x},#{y}] is gonna die"
      end
    end # cells each
    puts "/X"
    surroundings = flatten_coordinates(surroundings) #[ [[0,0], [0,1], [0,2], [0,3], [0,4]], [[1,0], [1,1], [1,2], [1,3], [1,4]] ]
    # puts surroundings.length
    surroundings.uniq!
    # puts surroundings.length

    puts "V"
    surroundings.each do |coord|
      x = coord[0]
      y = coord[1]

      adjacent_cells_count = grid.get_adjacent_cells_count(x,y)
      # binding.pry
      if adjacent_cells_count == 3
        grid.mark_for_birth(x,y)
        puts "V  #{x}|#{y} is gonna live"
      end
    end # surroundings.each
    puts "/V"
    # puts surroundings.inspect
    puts '#'*5
    grid.each do |cell|
      puts cell.inspect 
    end
    puts '#'*5
    grid.apply_changes()
    puts 'v'*5
    grid.each do |cell|
      puts cell.inspect 
    end
    puts 'v'*5
    # grid.each do |cell|
    # changed_obj.each do |cell|
      # cell.apply_changes()
    # end

    # puts "/Play turn"
  end
end