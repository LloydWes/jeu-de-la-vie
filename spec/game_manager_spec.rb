require 'game_manager'
require 'ruler'


RSpec.describe GameManager do
  before :each do
  end

  before do
    @game_manager = GameManager.new(10,10,60)
  end

  describe '#set_tickrate(tickrate)' do
    it 'should return true' do
      expect(@game_manager.set_tickrate(20)).to be true
    end

    it 'should return false' do
      expect(@game_manager.set_tickrate(0)).to be false
      expect(@game_manager.set_tickrate(201)).to be false
      expect(@game_manager.set_tickrate(500)).to be false
    end
  end

  describe '#set_ruler' do
    it 'should return true' do
      ruler = Ruler.new()
      expect(@game_manager.set_ruler(ruler)).to be true
    end

    it 'should return false' do
      expect(@game_manager.set_ruler(1)).to be false
      expect(@game_manager.set_ruler('ok')).to be false
      expect(@game_manager.set_ruler(:sym)).to be false
    end
  end

  describe '#ruler_is_set' do
    it 'should return true' do
      @game_manager.set_ruler(Ruler.new())
      expect(@game_manager.ruler_is_set).to be true
    end

    it 'should return true' do 
      @game_manager.set_ruler(Ruler.new())
      @game_manager.set_ruler(1)
      expect(@game_manager.ruler_is_set).to be true
    end

    it 'should return false' do
      @game_manager.set_ruler(1)
      expect(@game_manager.ruler_is_set).to be false
    end
  end
end