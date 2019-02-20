class TotalPointController < ApplicationController
  points_calculator(FirstUrl.select(:name, :view, :subscriber, :category_id))
  points_calculator(SecondUrl.select(:name, :view, :subscriber, :category_id))
  points_calculator(ThirdUrl.select(:name, :view, :subscriber, :category_id))

  def points_calculator(order_youtube_url)
    order_youtube_url.each do |url|
      @total_point = TotalPoint.new
      if TotalPoint.find_by(youtube_url: url.name)
        @total_point[:point] += 100/(url.view**(1/2.0)+url.subscriber**(1/2.0))
      else
        @total_point[:youtube_url] = url.name
        @total_point[:category_id] = url.category_id
        @total_point[:point] = 100/(url.view**(1/2.0)+url.subscriber**(1/2.0))
      end
      @total_point.save
    end
  end
end
