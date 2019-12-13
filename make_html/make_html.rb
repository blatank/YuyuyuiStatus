# make_html.rb
require 'csv'
require 'ERB'
require './Hero'
require './StatusTable'


def make_html(csvfile) #, htmlfile, title="")
  template_file = "./template.html.erb"

  # CSVファイルから各行を取得
  @tmp_datas = CSV.open(csvfile)

  # 先頭行だけデータから抜く
  topRow   = @tmp_datas.shift
  @title   = "#{topRow[0]}SSRのステータス"  # タイトル
  htmlfile = "../#{topRow[1]}.html"       # 出力先

  @datas = StatusTable.new

  # 各行を勇者クラスのインスタンスに変換
  @tmp_datas.each do |tmp_data|
    hero = Hero.new(tmp_data)
    @datas.add_hero(hero)
  end

  # データを解析
  @datas.analyze

  # テンプレ準備
  erb = ERB.new(File.read(template_file))
  erb.filename = template_file

  # テンプレに添ってHTML出力
  File.open(htmlfile, "w") do |f|
    f.puts(erb.result(binding))
  end
end
