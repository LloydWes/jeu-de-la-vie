require 'coordinate'

class Cell
  attr_reader :content, :coordinate

  def initialize(x, y, content)
    @content = content
    # @content = Hash.new
    @coordinate = Coordinate.new(x, y)
  end

  def x()
    @coordinate.x
  end

  def y()
    @coordinate.y
  end

  def x=(x)
    @coordinate.x ||= x
  end

  def y=(y)
    @coordinate.y ||= y
  end

  def inspect()
    "[#{@coordinate.x},#{@coordinate.y}] : #{@content}"
  end

  def set_content(key, value) #
    if value.respond_to?(:to_sym)
      @content[key.to_sym] = value.to_sym
    else
      @content[key.to_sym] = value
    end
  end

  def has_content(key) #
    if get_content(key) != nil
      true
    else
      false
    end
  end

  def get_content(key) #
    @content[key.to_sym]
  end

  def remove_content(key) #
    if @content[key.to_sym] != nil
      @content.delete(key.to_sym)
      true
    else
      false
    end
  end

  def clear_content() #
    if @content.length != 0
      @content.clear
      true
    else
      false
    end
  end

end
