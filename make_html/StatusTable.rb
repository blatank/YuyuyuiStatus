require './Hero'

class StatusTable
  attr_reader :heros
  STATUS_NUM = { "F-" =>  0, "F"  =>  1, "F+" =>  2,
                 "E-" =>  3, "E"  =>  4, "E+" =>  5,
                 "D-" =>  6, "D"  =>  7, "D+" =>  8,
                 "C-" =>  9, "C"  => 10, "C+" => 11,
                 "B-" => 12, "B"  => 13, "B+" => 14,
                 "A-" => 15, "A"  => 16, "A+" => 17,
                 "S-" => 18, "S"  => 19, "S+" => 20  }
  def initialize
    @heros     = []
  end

  def add_hero(hero)
    @heros.push(hero)
  end

  def analyze()
    # 最大値最小値を解析

    hp_data       = []
    atk_data      = []
    stamina_data  = []
    speed_data    = []
    crt_data      = []
    cost_data     = []
    sp_data       = []
    sp_ratio_data = []
    sp_atk_data   = []
    
    @heros.each do |hero|
      # URを入れるときっと最強になってしまうので参考程度にしたい
      if hero.isSSR?
        hp_data.push(hero.hp)
        atk_data.push(hero.atk)
        stamina_data.push(STATUS_NUM[hero.stamina])
        speed_data.push(STATUS_NUM[hero.speed])
        crt_data.push(STATUS_NUM[hero.crt])
        cost_data.push(hero.cost)
        sp_data.push(hero.sp)

        unless hero.sp_ratio == ""
          sp_ratio_data.push(hero.sp_ratio)
          sp_atk_data.push(hero.sp_atk)
        end
      else
        puts "info:#{hero.name}はSSRではないため、解析対象から除外しました"
      end
    end
    
    # URを含むとずれるのでこちらも評価しない
    @heros.each do |hero|
      if hero.isSSR?
        # HP
        if hp_data.min != hp_data.max
          if hero.hp == hp_data.max
            hero.hp_class = "strongest"
          elsif hero.hp == hp_data.min
            hero.hp_class = "weakest"
          end
        end

        # ATK
        if atk_data.min != atk_data.max
          if hero.atk == atk_data.max
            hero.atk_class = "strongest"
          elsif hero.atk == atk_data.min
            hero.atk_class = "weakest"
          end
        end

        # 踏ん張り
        if stamina_data.min != stamina_data.max
          if STATUS_NUM[hero.stamina] == stamina_data.max
            hero.stamina_class = "strongest"
          elsif STATUS_NUM[hero.stamina] == stamina_data.min
            hero.stamina_class = "weakest"
          end
        end

        # 速度
        if speed_data.min != speed_data.max
          if STATUS_NUM[hero.speed] == speed_data.max
            hero.speed_class = "strongest"
          elsif STATUS_NUM[hero.speed] == speed_data.min
            hero.speed_class = "weakest"
          end
        end

        # CRT
        if crt_data.min != crt_data.max
          if STATUS_NUM[hero.crt] == crt_data.max
            hero.crt_class = "strongest"
          elsif STATUS_NUM[hero.crt] == crt_data.min
            hero.crt_class = "weakest"
          end
        end

        # コストは高い方をweakestにする
        if cost_data.min != cost_data.max
          if hero.cost == cost_data.max
            hero.cost_class = "weakest"
          elsif hero.cost == cost_data.min
            hero.cost_class = "strongest"
          end
        end

        # SPは高い方をstrongestにする
        if sp_data.min != sp_data.max
          if hero.sp == sp_data.max
            hero.sp_class = "strongest"
          elsif hero.sp == sp_data.min
            hero.sp_class = "weakest"
          end
        end

        unless hero.sp_ratio == ""
          # 必殺技倍率は高い方をstrongestにする
          if sp_ratio_data.min != sp_ratio_data.max
            if hero.sp_ratio == sp_ratio_data.max
              hero.sp_ratio_class = "strongest"
            elsif hero.sp_ratio == sp_ratio_data.min
              hero.sp_ratio_class = "weakest"
            end
          end

          # 必殺技ATKは高い方をstrongestにする
          if hero.sp_atk == sp_atk_data.max
            hero.sp_atk_class = "strongest"
          elsif hero.sp_atk == sp_atk_data.min
            hero.sp_atk_class = "weakest"
          end
        end
      end
    end
  end
end