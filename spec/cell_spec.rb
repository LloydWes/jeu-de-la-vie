require "cell"


RSpec.describe Cell do
  before :each do 
    @cell = Cell.new(1,1)
  end

  describe '#x=(), #y=() w/before :each' do 
    it 'forbide a cell to change its coordinates' do 
      @cell.x = 2
      @cell.y = 2
      expect(@cell.x).to eq 1
      expect(@cell.y).to eq 1
    end
  end
  describe '#x(), y() w/before :each' do 
    it 'returns the proper coordinates' do 
      expect(@cell.x).to eq 1
      expect(@cell.y).to eq 1
    end
  end

  describe '#add_content' do 
    it 'should return true' do 
      expect(@cell.add_content('type', 'cell')).to be true
    end

    it 'should return false' do 
      @cell.add_content('type', 'cell')
      expect(@cell.add_content('type', 'cell')).to be false
    end
  end

  describe '#remove_content' do
    it 'should return true' do
      @cell.add_content('type', 'cell')
      expect(@cell.remove_content('type')).to be true
    end

    it 'should return false' do
      expect(@cell.remove_content('type')).to be false
    end
  end

  describe '#clear_all_content()' do 
    it 'should return true' do 
      @cell.add_content('type', 'cell')
      @cell.add_content('color', 'blue')
      expect(@cell.clear_all_content).to be true
    end

    it 'should return false' do 
      expect(@cell.clear_all_content).to be false
    end
  end

end