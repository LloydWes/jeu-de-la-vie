require 'coordinate'

class Cell
  attr_reader :content, :coordinate

  def initialize(x, y)
    @content = Hash.new
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

  def add_content(key,value)
    if @content[key.to_sym] == nil
      @content[key.to_sym] = value.to_sym
      true
    else
      false
    end
  end

  def has_content(key)
    if @content[key.to_sym] != nil
      true
    else
      false
    end
  end

  def remove_content(key)
    if @content[key.to_sym] != nil
      @content.delete(key.to_sym)
      true
    else
      false
    end
  end

  def clear_all_content()
    if @content.length != 0
      @content.clear
      true
    else
      false
    end
  end
end
