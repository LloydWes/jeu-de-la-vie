require "cell"


RSpec.describe Cell do
  before :each do 
    @cell = Cell.new(1,1, {})
  end

  describe '#x=(), #y=()' do
    it 'forbide a cell to change its coordinates' do
      @cell.x = 2
      @cell.y = 2
      expect(@cell.x).to eq 1
      expect(@cell.y).to eq 1
    end
  end

  describe '#x(), y()' do
    it 'returns the proper coordinates' do
      expect(@cell.x).to eq 1
      expect(@cell.y).to eq 1
    end
  end

  describe '#set_content()' do 
    it 'should be a Symbol' do
      expect(@cell.set_content(:type, :cell).class).to be Symbol
    end

    it 'should return :cell' do
      expect(@cell.set_content(:type, :cell)).to eq :cell
    end

    it 'should be an Integer' do
      expect(@cell.set_content(:changes, 2).class).to be Integer
    end

    it 'should return 2' do 
      expect(@cell.set_content(:changes, 2)).to eq 2
    end
  end

  describe '#has_content()' do 
    it 'should be true' do
      @cell.set_content(:type, :cell)
      @cell.set_content(:other, :whatever)
      expect(@cell.has_content(:type)).to be true
    end

    it 'should be false' do
      expect(@cell.has_content(:type)).to be false
    end
  end

  describe '#get_content()' do
    it 'should be a Symbol' do
      @cell.set_content(:type, :cell)
      @cell.set_content(:other, :whatever)
      expect(@cell.get_content(:type).class).to be Symbol
    end

    it 'should return :cell' do
      @cell.set_content(:type, :cell)
      expect(@cell.get_content(:type)).to eq :cell
    end

    it 'should return nil' do
      expect(@cell.get_content(:none)).to be nil
    end
  end

  describe '#remove_content()' do
    it 'should return true' do
      @cell.set_content(:type, :cell)
      expect(@cell.remove_content(:type)).to be true
    end

    it 'should return false' do
      expect(@cell.remove_content(:type)).to be false
    end
  end

  describe '#clear_content()' do
    it 'should return true' do
      @cell.set_content(:type, :cell)
      @cell.set_content(:color, :blue)
      expect(@cell.clear_content).to be true
    end

    it 'should return false' do
      expect(@cell.clear_content).to be false
    end
  end
  
end