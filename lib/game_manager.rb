require 'life_game_grid'
require 'graphic'
require 'ruler'

class GameManager
  attr_reader :grid, :tickrate, :ticks, :graphic
  attr_accessor :ruler_is_set, :state, :ruler

  def initialize(width, height, tickrate)
    tickrate = tickrate
    @ruler_is_set = false
    @grid = LifeGameGrid.new(width, height)
  end

  def set_tickrate(tickrate) #
    if tickrate > 0 && tickrate <= 200
      @tickrate = tickrate
      true
    else
      false
    end
  end

  def set_ruler(ruler) #
    if ruler.class == Ruler
      @ruler = ruler
      @ruler_is_set = true
      true
    else
      false
    end
  end

  def play_turn()
    @ruler.play_turn(@grid)
  end

  #####################################
  def set_state(state)
    @state = state.to_sym
  end

end