require 'game_manager'
require 'ruler'

RSpec.describe 'Integration test' do
  before do
    @game_manager = GameManager.new(100, 100, 1)
    @game_manager.grid.add_cell(1,0, {type: 'cell'})
    @game_manager.grid.add_cell(1,1, {type: 'cell'})
    @game_manager.grid.add_cell(1,2, {type: 'cell'})

    @game_manager.grid.add_cell(3,3, {type: 'cell'})

    @game_manager.grid.add_cell(1,5, {type: 'cell'})
    @game_manager.grid.add_cell(2,5, {type: 'cell'})
    @game_manager.grid.add_cell(3,5, {type: 'cell'})
    @game_manager.grid.add_cell(1,6, {type: 'cell'})
    @game_manager.grid.add_cell(2,6, {type: 'cell'})
    @game_manager.grid.add_cell(3,6, {type: 'cell'})

    @game_manager.grid.add_cell(1,9, {type: 'cell'})
    @game_manager.grid.add_cell(2,9, {type: 'cell'})
    @game_manager.grid.add_cell(3,9, {type: 'cell'})


    @ruler = Ruler.new()
    @game_manager.set_ruler(@ruler)
  end

  describe '#play_turn' do
    it 'should pop in 0,2' do
      # @game_manager.grid.display_grid()
      expect {@game_manager.play_turn()}.to change{@game_manager.grid.cell_does_exist(0,2)}.from(false).to(true)
    end

    it 'should die in 3,3' do
      # @game_manager.grid.display_grid()
      expect(@game_manager.grid.find_cell(3,3)).to be false
      # expect {@game_manager.play_turn()}.to change{@game_manager.grid.cell_does_exist(3,3)}.from(true).to(false)
    end

    it 'should die in 2,5 and in 2,6' do
    end

    it 'should die in 1,9|3,9 and pop in 2,8|2,10' do
    end

    it 'should pop in 3,4' do
    end
  end


end



  # describe '#play_turn' do
  #   xit 'should ' do
  #     game_manager = GameManager.new(100, 100, 1)

  #     game_manager.grid.add_cell(0,0, {})
  #     game_manager.grid.add_cell(1,0, {})
  #     game_manager.grid.add_cell(2,0, {})
  #     game_manager.grid.add_cell(0,1, {})
  #     game_manager.grid.add_cell(2,1, {})
  #     game_manager.grid.add_cell(0,2, {})
  #     game_manager.grid.add_cell(1,2, {})
  #     game_manager.grid.add_cell(2,2, {})

  #     game_manager.set_ruler(@ruler)

  #     game_manager.play_turn()
  #   end
  # end