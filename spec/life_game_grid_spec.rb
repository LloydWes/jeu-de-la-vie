require 'life_game_grid'
require 'cell'

RSpec.describe LifeGameGrid do
  before :all do
  end

  before do 
    @grid = LifeGameGrid.new(100,100)
  end

  describe '#get_adjacent_coordinates' do
    before do
      @grid.add_cell(1,1, {})
      @adjacent_coordinates = @grid.get_adjacent_coordinates(1,1)
    end
    it 'should be an Array' do 
      expect(@adjacent_coordinates.class).to be Array
    end
    it 'should return 8' do
      expect(@adjacent_coordinates.length).to eq 8
    end
    it 'should ' do
      expect(@adjacent_coordinates.sort).to eq [[0,0], [1,0], [2,0], [0,1], [2,1], [0,2], [1,2], [2,2]].sort
    end
  end

  describe '#get_adjacent_cells' do
    before do
      @grid.add_cell(1,1, {type: :cell})

      @grid.add_cell(0,0, {type: :cell})
      @grid.add_cell(1,0, {type: :cell})
      @grid.add_cell(2,0, {type: :cell})
      @grid.add_cell(0,1, {type: :cell})
      @grid.add_cell(2,1, {type: :cell})
      @grid.add_cell(0,2, {type: :cell})
      @grid.add_cell(1,2, {type: :cell})
      @grid.add_cell(2,2, {type: :cell})

      @adjacent_cells = @grid.get_adjacent_cells(1,1)
    end
    it 'should be an Array' do 
      expect(@adjacent_cells.class).to be Array
    end

    it 'should be a Cell' do
      expect(@adjacent_cells[0].class).to be Cell
    end

    it 'should return 8' do
      expect(@adjacent_cells.length).to eq 8
    end
  end

  describe '#get_adjacent_cells_count' do
    before do
      @grid.add_cell(0,0, {type: :cell})
      @grid.add_cell(1,0, {type: :cell})
    end
    it 'should be 1' do
      expect(@grid.get_adjacent_cells_count(0,0)).to eq 1
    end
    context 'with one more cell' do
      before do 
        @grid.add_cell(0,1, {})
      end
      it 'should be 2' do
        expect(@grid.get_adjacent_cells_count(0,0)).to eq 2
      end
      it 'should return 2' do
        expect(@grid.get_adjacent_cells_count(1,0)).to eq 2
      end
      context 'with 5 more cells' do
        before do 
          @grid.add_cell(5,1, {type: :cell})
          @grid.add_cell(5,2, {type: :cell})
          @grid.add_cell(5,3, {type: :cell})
          @grid.add_cell(6,1, {type: :cell})
          @grid.add_cell(6,2, {type: :cell})
        end

        it 'should be 3' do
          expect(@grid.get_adjacent_cells_count(5,1)).to eq 3
        end

        it 'should be 4' do
          expect(@grid.get_adjacent_cells_count(5,2)).to eq 4
        end

        it 'should be 2' do
          expect(@grid.get_adjacent_cells_count(5,3)).to eq 2
        end
      end
    end
  end

  describe '#mark_for_deletion' do
    it 'should be true' do 
      @grid.add_cell(1,1, {type: :cell})
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
      @grid.add_cell(1,1, {type: :cell})
      expect(@grid.mark_for_birth(1,1)).to be false
    end
  end

  describe '#apply_changes()' do
    before do
      @grid.mark_for_birth(1,1)
    end

    it 'should be true' do
      expect(@grid.cell_does_exist(1,1)).to be true
    end

    it 'should give birth' do
      # expect{@grid.apply_changes()}.to change{@grid.find_cell(1,1).get_content(:type)}.from(nil).to('cell')
    end

    it 'should remove the cell' do
      # @grid.mark_for_deletion(1,1)
      # expect{@grid.apply_changes()}.to change{@grid.find_cell(1,1).class}.from(Cell).to(NilClass)
    end
  end
end
