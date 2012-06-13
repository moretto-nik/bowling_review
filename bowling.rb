require_relative 'frame'

class Bowling
  
  def initialize(game)
    @game = game
  end
  
  def set_game_point
    beforeFrame = @game.first
    turkey = nil
    
    @game[1..10].each do |frame|
      if beforeFrame.spare?
        beforeFrame.add_to_total_point(frame.first_roll)
      elsif beforeFrame.strike?
        beforeFrame.add_to_total_point(frame.total_roll)
        
        if turkey != nil
          turkey.add_to_total_point(frame.first_roll)
          beforeFrame.add_to_total_point(frame.first_roll)
          turkey = nil
        end
        
        if frame.second_roll == 0
          turkey = beforeFrame
        end
      end
      
      frame.add_to_total_point(beforeFrame.total_roll)
      beforeFrame = frame
    end
    
    if @game.last.spare?
      @game.last.add_last_spare
    elsif @game.last.strike?
      @game.last.add_last_strike
    end
    
  end
  
  def total_game_point
    if @game.length == 0
      0
    else
      set_game_point
      @game.last.total_roll
    end
  end
  
end