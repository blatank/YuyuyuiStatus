# Hero.rb
# 勇者クラス
class Hero
  attr_reader   :color
  attr_reader   :rare
  attr_reader   :name
  attr_reader   :hp
  attr_reader   :atk
  attr_reader   :stamina
  attr_reader   :speed
  attr_reader   :crt
  attr_reader   :cost
  attr_reader   :sp
  attr_accessor :hp_class
  attr_accessor :atk_class
  attr_accessor :stamina_class
  attr_accessor :speed_class
  attr_accessor :crt_class
  attr_accessor :cost_class
  attr_accessor :sp_class
  
  def initialize(line)
    @color     = line[0]
    @rare      = line[1]
    @name      = line[2]
    @hp        = line[3].to_i
    @atk       = line[4].to_i
    @stamina   = line[5]
    @speed     = line[6]
    @crt       = line[7]
    @cost      = line[8].to_i
    @sp        = line[9].to_i

    @hp_class      = ""
    @atk_class     = ""
    @stamina_class = ""
    @speed_class   = ""
    @crt_class     = ""
    @cost_class    = ""
    @sp_class    = ""
  end

  def isUR?
    return @rare == "UR"
  end
end
