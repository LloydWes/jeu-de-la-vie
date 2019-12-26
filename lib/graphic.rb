require 'ruby2d'

class Graphic
  attr_reader :height, :width, :window, :update, :authorized_colors

  def initialize(width, height)
    @width = width
    @height = height
    @update = Proc.new() {}
    @window = Ruby2D::Window.new()
    @authorized_colors = %w(navy blue aqua teal olive green lime yellow orange red brown fuchsia purple maroon white silver gray black)
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
      @window.update &@update
      # puts @window.inspect
      true
    else
      false
    end
  end

  def draw_square(x, y, size, color)
    if authorized_colors.include?(color.to_s)
      square = Square.new(x: x,
        y: y,
        size: size,
        color: color)
      # @window.remove(square)
      
      # puts '-'*10, @window.inspect, '|'*10
    else
      false
    end
  end

  def draw_rectangle(x, y, width, height, color)
  end

  def clear_window()
  end
end

