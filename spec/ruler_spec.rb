require 'ruler'
require 'game_manager'

RSpec.describe Ruler do
  before do  
    @ruler = Ruler.new()
  end

  describe '#set_update(proc)' do 
    it 'should be true' do
      update_proc = Proc.new() {}
      expect(@ruler.set_update(&update_proc)).to be true
    end

    it 'should be false' do
      expect(@ruler.set_update()).to be false
    end
  end

  describe '#get_update()' do 
    it 'should return a Proc' do 
      @ruler.set_update(&Proc.new(){})
      expect(@ruler.get_update().class).to be Proc
    end
  end

  describe '#play_turn' do
    xit 'should ' do
      game_manager = GameManager.new(100, 100, 1)

      game_manager.grid.add_cell(0,0, {})
      game_manager.grid.add_cell(1,0, {})
      game_manager.grid.add_cell(2,0, {})
      game_manager.grid.add_cell(0,1, {})
      game_manager.grid.add_cell(2,1, {})
      game_manager.grid.add_cell(0,2, {})
      game_manager.grid.add_cell(1,2, {})
      game_manager.grid.add_cell(2,2, {})

      game_manager.set_ruler(@ruler)

      game_manager.play_turn()
    end
  end

end