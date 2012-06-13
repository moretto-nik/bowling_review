require 'spec_helper'

describe Frame do
  
  describe 'simple frame get roll' do
    before :each do
      @frame = Frame.new([4,2])
    end
    
    it 'first' do
      @frame.first_roll.should == 4
    end
    
    it 'second' do
      @frame.second_roll.should == 2
    end
    
    it 'total' do
      @frame.total_roll.should == 4 + 2
    end
  end
  
  describe 'spare frame' do
    before :each do
      @frameSpare = Frame.new([5,5])
    end
    
    it 'spare?' do
      @frameSpare.should be_spare
    end
  end
  
  describe 'strike frame' do
    before :each do
      @frameStrike = Frame.new([10,0])
    end
    
    it 'strike?' do
      @frameStrike.should be_strike
    end
  end
  
  it 'plus point to frame after initialization' do
    @frameToPlus = Frame.new([10,0])
    @frameToPlus.add_to_total_point(10)
    @frameToPlus.total_roll.should == 10 + 10
  end
  
end