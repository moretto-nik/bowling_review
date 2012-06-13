class Frame
  
  def initialize(roll)
    @roll = roll
    @total_point = first_roll + second_roll
    
    if first_roll == 10
      @strike = true
    elsif total_roll == 10
      @spare = true
    end
  end
  
  def first_roll
    @roll.first
  end
  
  def second_roll
    @roll[1]
  end
  
  def total_roll
    @total_point
  end
  
  def spare?
    @spare
  end
  
  def strike?
    @strike
  end
  
  def add_to_total_point(value)
    @total_point += value
  end
  
  def add_last_spare
    @total_point += @roll[2]
  end
  
  def add_last_strike
    @total_point += @roll[2]+@roll[3]
  end
end