# Hero.rb
# 勇者クラス
class Hero
  attr_reader :color
  attr_reader :rare
  attr_reader :name
  attr_reader :hp
  attr_reader :atk
  attr_reader :stamina
  attr_reader :speed
  attr_reader :crt
  attr_reader :cost
  attr_reader :sp
  attr_reader :hp_class
  attr_reader :atk_class
  attr_reader :crt_class
  
  def initialize(line)
    @color     = line[0]
    @rare      = line[1]
    @name      = line[2]
    @hp        = line[3]
    @atk       = line[4]
    @stamina   = line[5]
    @speed     = line[6]
    @crt       = line[7]
    @cost      = line[8]
    @sp        = line[9]

    @hp_class  = ""
    @atk_class = ""
    @crt_class = ""
  end

  def hp_strongest
    @hp_class = "strongest"
  end

  def hp_weakest
    @hp_class = "weakest"
  end

  def atk_strongest
    @atk_class = "strongest"
  end

  def atk_weakest
    @atk_class = "weakest"
  end

  def crt_strongest
    @crt_class = "strongest"
  end

  def crt_weakest
    @crt_class = "weakest"
  end
end
