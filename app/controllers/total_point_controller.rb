class TotalPointController < ApplicationController
  @total_point = TotalPoint.new
  @total_point[:youtube_url] = FirstUrl.select('name')
  @total_point[:point] = 100
  @total_point.save


  @first_youtube_url = FirstUrl.select(:name)
  # nameカラムの全てのレコードを取得
  @first_youtube_url.each do |f|
    # each使ってfにレコードを代入
    @total_point = TotalPoint.new
    # @total_pointは空のレコード
    @total_point[:youtube_url] = f.name
    @total_point[:point] = 200
    @total_point.save
  end
end
