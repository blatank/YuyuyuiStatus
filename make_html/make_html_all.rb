require './make_html'

# CSVディレクトリ内のCSVファイルをすべて変換
Dir.glob("../csv/*.csv") do |csv|
	make_html(csv)
end
