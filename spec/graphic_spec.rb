require 'graphic'


RSpec.describe Graphic do 
  before do
    @graphic = Graphic.new(10,10)
  end

  describe '#set_update' do 
    it 'should return true' do 
      set_block = @graphic.set_update(&Proc.new(){})
      expect(set_block).to be true
    end
  end

  describe '#get_update()' do 
    it 'should return a Proc' do 
      @graphic.set_update(&Proc.new(){})
      expect(@graphic.get_update().class).to be Proc
    end
  end

  describe '#draw_square' do 
    it 'should return ___________' do
      square = @graphic.draw_square(0,0,10,'blue');
      expect(square).to be true
    end
  end

  describe '#remove' do
    it 'should ______' do
    end
  end

end

