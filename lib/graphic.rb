require 'ruby2d'
require 'game_manager'

class Graphic
  attr_reader :height, :width, :window, :update

  def initialize(width, height)
    @width = width
    @height = height
    @update = Proc.new() {}
  end

  def get_width()
    @width
  end

  def get_height()
    @height
  end

  def get_update()
    @update
  end

  def set_update(&block)
    if block.is_a?(Proc)
      @update = block
      true
    else
      false
    end
  end
end

