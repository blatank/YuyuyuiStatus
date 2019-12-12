# make_html.rb
require 'csv'
require 'ERB'
require './Hero'
require './StatusTable'


def make_html(csvfile, htmlfile, title="")
  template_file = "./template.html.erb"

  # HTMLヘッダ出力

  ### 各行出力 ###
  @tmp_datas = CSV.open(csvfile)
  @title = title
  # 先頭行はコメント扱いなので捨てる
  @tmp_datas.shift

  @datas = StatusTable.new

  @tmp_datas.each do |tmp_data|
    hero = Hero.new(tmp_data)
    @datas.add_hero(hero)
  end

  # @datas = add_est(@datas)
  @datas.analyze

  # テンプレに添って出力
  erb = ERB.new(File.read(template_file))
  erb.filename = template_file

  File.open(htmlfile, "w") do |f|
    f.puts(erb.result(binding))
  end
  # puts erb.result(binding)
   # datas.each do |data|
  #   puts data.size
  # end

  # HTMLフッタ出力
end

# def add_est(datas)
#   hp_datas = []
#   atk_datas = []
#   datas.each do |data|
#     hp_datas.push(data[:hp])
#     atk_datas.push(data[:atk])
#   end

  
#   newdatas = []
#   datas.each do |data|
#     if hp_datas.max == data[:hp]
#       data[:hp_class] = "strongest"
#     elsif hp_datas.min == data[:hp]
#       data[:hp_class] = "weakest"
#     else
#       data[:hp_class] = "normal"
#     end

#     if atk_datas.max == data[:atk]
#       data[:atk_class] = "strongest"
#     elsif atk_datas.min == data[:atk]
#       data[:atk_class] = "weakest"
#     else
#       data[:atk_class] = "normal"
#     end   

#     newdatas.push(data)
#   end
#   return newdatas
# end

# def conv_data(tmp_data)
#   data = {}
#   data[:color]  = tmp_data[0]
#   data[:rare]   = tmp_data[1]
#   data[:name]   = tmp_data[2]
#   data[:hp]     = tmp_data[3]
#   data[:atk]    = tmp_data[4]
#   data[:stm]    = tmp_data[5]
#   data[:speed]  = tmp_data[6]
#   data[:crt]    = tmp_data[7]
#   data[:cost]   = tmp_data[8]
#   data[:sp]     = tmp_data[9]
#   return data
# end
