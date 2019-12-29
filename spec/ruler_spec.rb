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

  #play_turn is tested somewhere else
e
end