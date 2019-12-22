require 'life_game_grid'
require 'cell'

RSpec.describe LifeGameGrid do
  before :all do
  end

  before do 
    @grid = LifeGameGrid.new(100,100)
  end

  describe '#get_adjacent_coordinates' do
    it 'should' do 
      @grid.add_cell(1,1, {})
      adjacent_coordinates = @grid.get_adjacent_coordinates(1,1)

      expect(adjacent_coordinates.class).to be Array
      expect(adjacent_coordinates.length).to eq 8
      expect(adjacent_coordinates.sort).to eq [[0,0], [1,0], [2,0], [0,1], [2,1], [0,2], [1,2], [2,2]].sort
    end
  end

  describe '#get_adjacent_cells' do
    it 'should return proper cell informations' do 
      @grid.add_cell(1,1, {})

      @grid.add_cell(0,0, {})
      @grid.add_cell(1,0, {})
      @grid.add_cell(2,0, {})
      @grid.add_cell(0,1, {})
      @grid.add_cell(2,1, {})
      @grid.add_cell(0,2, {})
      @grid.add_cell(1,2, {})
      @grid.add_cell(2,2, {})

      adjacent_cells = @grid.get_adjacent_cells(1,1)

      expect(adjacent_cells.class).to be Array
      expect(adjacent_cells[0].class).to be Cell
      expect(adjacent_cells.length).to eq 8
    end
  end

  describe '#mark_for_deletion' do
    it 'should be true' do 
      @grid.add_cell(1,1, {type: 'cell'})
      expect(@grid.mark_for_deletion(1,1)).to be true
    end

    it 'should be false' do 
      expect(@grid.mark_for_deletion(1,1)).to be false
    end
  end

  describe '#mark_for_birth' do
    it 'should be true' do
      expect(@grid.mark_for_birth(1,1)).to be true
    end

    it 'should be false' do 
      @grid.add_cell(1,1, {type: 'cell'})
      expect(@grid.mark_for_birth(1,1)).to be false
    end
  end
end