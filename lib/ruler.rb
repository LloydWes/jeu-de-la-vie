class Ruler

  attr_reader :update

  def initialize()
    @update = Proc.new() {}
  end

  def set_update(&block)
    if block.is_a?(Proc)
      @update = block
      true
    else
      false
    end
  end

  def get_update()
    @update
  end
end