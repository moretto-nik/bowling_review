require 'spec_helper'

describe Bowling do
  
  it 'game 0' do
    @bowling0 = Bowling.new([])
    @bowling0.total_game_point.should == 0
  end
  
  it 'simplex game' do
    @bowlingSimplex = Bowling.new([Frame.new([3,6]),Frame.new([2,5])])
    @bowlingSimplex.total_game_point.should == 3+6 + 2+5
  end
  
  describe 'game with spare' do
    before :each do
      @bowlingSpareFirst = Bowling.new([Frame.new([4,6]),Frame.new([2,5]),Frame.new([3,2]),Frame.new([4,5])])
      @bowlingSpareMiddle = Bowling.new([Frame.new([2,5]),Frame.new([3,2]),Frame.new([4,6]),Frame.new([4,5])])
      @bowlingSpareLast = Bowling.new([Frame.new([2,5]),Frame.new([3,2]),Frame.new([4,5]),Frame.new([4,6,4])])
    end
    
    it 'first is spare' do
      @bowlingSpareFirst.total_game_point.should == 4+6+2 + 2+5 + 3+2 + 4+5
    end
    
    it 'frame in middle is spare' do
      @bowlingSpareMiddle.total_game_point.should == 2+5 + 3+2 + 4+6+4 + 4+5
    end
    
    it 'last is spare' do
      @bowlingSpareLast.total_game_point.should == 2+5 + 3+2 + 4+5 + 4+6+4
    end
  end
  
  describe 'game with strike' do
    before :each do
      @bowlingStrikeFirst = Bowling.new([Frame.new([10,0]),Frame.new([2,5]),Frame.new([3,2]),Frame.new([4,5])])
      @bowlingStrikeMiddle = Bowling.new([Frame.new([2,5]),Frame.new([3,2]),Frame.new([10,0]),Frame.new([4,5])])
      @bowlingStrikeLast = Bowling.new([Frame.new([2,5]),Frame.new([3,2]),Frame.new([4,5]),Frame.new([10,0,4,5])])
    end
    
    it 'first is strike' do
      @bowlingStrikeFirst.total_game_point.should == 10+2+5 + 2+5 + 3+2 + 4+5
    end
    
    it 'frame in middle is strike' do
      @bowlingStrikeMiddle.total_game_point.should == 2+5 + 3+2 + 10+4+5 + 4+5
    end
    
    it 'last is spare' do
      @bowlingStrikeLast.total_game_point.should == 2+5 + 3+2 + 4+5 + 10+0+4+5
    end
  end
  
  it 'complex game' do
    @bowlingGame = Bowling.new([Frame.new([1,4]),Frame.new([4,5]),Frame.new([6,4]),Frame.new([5,5]),Frame.new([10,0]),Frame.new([0,1]),
    Frame.new([7,3]),Frame.new([6,4]),Frame.new([10,0]),Frame.new([2,8,6])])
    @bowlingGame.total_game_point.should == 1+4 + 4+5 + 6+4+5 + 5+5+10 + 10+0+0+1 + 0+1 + 7+3+6 + 6+4+10 + 10+0+2+8 + 2+8+6
  end
  
  it 'turkey' do
    @bowlingTurkey = Bowling.new([Frame.new([10,0]),Frame.new([10,0]),Frame.new([10,0]),Frame.new([1,3]),Frame.new([1,3])])
    @bowlingTurkey.total_game_point.should == 10+10+10 + 10+10+1 + 10+1+3 + 1+3 + 1+3
  end
  
  it 'perfect match' do
    @bowlingPerfect = Bowling.new([Frame.new([10,0]),Frame.new([10,0]),Frame.new([10,0]),Frame.new([10,0]),Frame.new([10,0]),
    Frame.new([10,0]),Frame.new([10,0]),Frame.new([10,0]),Frame.new([10,0]),Frame.new([10,10,10,0])])
    @bowlingPerfect.total_game_point.should == 300
  end
  
end