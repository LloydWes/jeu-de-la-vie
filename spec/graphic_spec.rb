require 'graphic'
require 'game_manager'


RSpec.describe Graphic do 
  before do
    @graphic = Graphic.new(10,10)
  end

  describe '#set_update()' do 
    it 'should return a Proc' do 
      @graphic.set_update(&Proc.new(){})
      expect(@graphic.get_update().class).to be Proc
    end
  end


end

