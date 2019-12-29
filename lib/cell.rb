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

  def add_content(key,value)
    if @content[key.to_sym] == nil
      @content[key.to_sym] = value
      true
    else
      false
    end
  end

  def get_content(key)
    @content[key.to_sym]
    # if @content[key.to_sym] != nil
    #   @content[key.to_sym]
    # else
    #   nil
    # end
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

  def apply_changes()
    print "Applied changes for #{inspect} "
    if @content[:changes] != nil
      @content[:changes] = @content[:changes] - 1
      if @content[:changes] == 0
        @content.delete(:changes)

        cont = @content[:will_be]
        case cont
        when 'dead'
          @content[:type] = 'none'
        when 'cell'
          @content[:type] = 'cell'
        end
        @content.delete(:will_be)
      end
    end
    puts "vs #{inspect}"
    @content
  end
end
