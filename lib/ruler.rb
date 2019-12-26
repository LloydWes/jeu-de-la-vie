class Ruler

  attr_reader :update

  def initialize()
    @update = Proc.new() {} #useless
  end

  def set_update(&block) # Useless
    if block.is_a?(Proc)
      @update = block
      true
    else
      false
    end
  end

  def get_update() #useless
    @update
  end

  def play_turn(grid)
    surroundings = Array.new
    changed_obj = Array.new
    grid.each do |cell|
      x = cell.x
      y = cell.y
      surroundings << grid.get_adjacent_coordinates(x,y)
      adjacent_cells_count = grid.get_adjacent_cells_count(x,y)

      if adjacent_cells_count < 2 || adjacent_cells_count > 3
        grid.mark_for_deletion(x,y)
      end
    end # cells each
    surroundings.uniq!

    puts 'play_turn'
    surroundings.each {|c| puts c.inspect}
    # puts '-'*10, surroundings.each {|c| puts c.inspect}, '-'*10
    surroundings.each do |coord|
      x = coord[0]
      y = coord[1]

      adjacent_cells_count = grid.get_adjacent_cells_count(x,y)
      if adjacent_cells_count == 3
        grid.mark_for_birth(x,y)
      end
    end
    # puts surroundings.inspect
    changed_obj.each do |cell|
      cell.apply_changes()
    end

  end
end