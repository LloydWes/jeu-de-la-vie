require 'grid_abstraction'

RSpec.describe GridAbstraction do 
  before :each do 
  end

  describe '#height_limit=()/-width_limit=()' do 
    it 'should always be >= 0' do 
      grid = GridAbstraction.new(-1, -1)
    end
  end

  describe '#height_limit/+width_limit' do 
    it 'should be able to read limit values' do 
      grid = GridAbstraction.new(10,10)
      expect(grid.height_limit).to eq 10
      expect(grid.width_limit).to eq 10
    end
  end

  before do
    @grid = GridAbstraction.new(100,100)
  end

  describe '#add_cell()' do #---------------------------------- add_cell()
    it 'should be able to add a cell' do 
      old_size = @grid.get_grid_size()
      @grid.add_cell(1,1, {type: 'cell'})
      new_size = @grid.get_grid_size()

      expect(new_size).to eq (old_size + 1)
    end

    it "shouldn't be able to add a cell off limits" do 
      new_cell = @grid.add_cell(2000,2000, {type: 'cell'})
      expect(new_cell).to eq nil
    end

    it "shouldn't be able to add a cell with existing coordinates" do 
      @grid.add_cell(1,1, {type: 'cell'})
      new_cell = @grid.add_cell(1,1, {type: 'cell'})

      expect(new_cell).to eq nil
    end
  end

  describe '#find_cell()' do #---------------------------------- find_cell()
    it 'should return the correct case based on its coordinates' do 
      @grid.add_cell(2, 3, {type: 'cell'})

      cell = @grid.find_cell(2,3)
      expect(cell).not_to eq nil 
    end
  end

  describe '#remove_cell()' do #---------------------------------- remove_cell()
    it 'should be able to remove a cell' do
      @grid.add_cell(1,1, {type: 'cell'})

      expect {@grid.remove_cell(1,1)}.to \
      change(@grid.cells, :length).from(1).to(0)
    end

    it 'should return the last deleted cell' do 
      @grid.add_cell(1,1, {type: 'cell'})
      removed_cell = @grid.remove_cell(1, 1)

      expect(removed_cell.class).to be Cell
      expect(removed_cell).not_to eq nil
    end

    it "shouldn't be able to remove a cell if the grid is empty" do 
      removed_cell = @grid.remove_cell(1,1)

      expect(removed_cell).to eq nil
    end
  end

  describe '#min_x()/#max_x()' do
    it 'should return x min and max' do 
      @grid.add_cell(-1,1, {type: 'cell'})
      @grid.add_cell(1,2, {type: 'cell'})
      @grid.add_cell(1,3, {type: 'cell'})
      @grid.add_cell(1,4, {type: 'cell'})
      @grid.add_cell(1,5, {type: 'cell'})
      @grid.add_cell(1,6, {type: 'cell'})
      @grid.add_cell(1,7, {type: 'cell'})
      @grid.add_cell(1,8, {type: 'cell'})
      @grid.add_cell(1,9, {type: 'cell'})
      @grid.add_cell(2,1, {type: 'cell'})
      @grid.add_cell(2,2, {type: 'cell'})
      @grid.add_cell(2,3, {type: 'cell'})
      @grid.add_cell(3,4, {type: 'cell'})
      @grid.add_cell(4,4, {type: 'cell'})
      @grid.add_cell(5,4, {type: 'cell'})
      @grid.add_cell(6,4, {type: 'cell'})
      expect(@grid.min_x()).to eq -1
      expect(@grid.max_x()).to eq 6
    end
  end

  describe '#min_y/#max_y' do 
    it 'shoudl return y min and max' do 
      @grid.add_cell(-1,-1, {type: 'cell'})
      @grid.add_cell(1,2, {type: 'cell'})
      @grid.add_cell(1,3, {type: 'cell'})
      @grid.add_cell(1,4, {type: 'cell'})
      @grid.add_cell(1,5, {type: 'cell'})
      @grid.add_cell(1,6, {type: 'cell'})
      @grid.add_cell(1,7, {type: 'cell'})
      @grid.add_cell(1,8, {type: 'cell'})
      @grid.add_cell(1,9, {type: 'cell'})
      @grid.add_cell(2,1, {type: 'cell'})
      @grid.add_cell(2,2, {type: 'cell'})
      @grid.add_cell(2,3, {type: 'cell'})
      @grid.add_cell(3,4, {type: 'cell'})
      @grid.add_cell(4,4, {type: 'cell'})
      @grid.add_cell(5,4, {type: 'cell'})
      @grid.add_cell(6,4, {type: 'cell'})
      expect(@grid.min_y()).to eq -1
      expect(@grid.max_y()).to eq 9
    end
  end

end













