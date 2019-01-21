class CategoriesController < ApplicationController

  def create
    @category = Category.new(category_params)
    if @category.save
      respond_to do |format|
        format.html { redirect_to root_path, notice: '投稿できました' }
        format.json
      end
    else
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end

    scraping_video(FirstUrl.new(first_url_params))
    scraping_video(SecondUrl.new(second_url_params))
    scraping_video(ThirdUrl.new(third_url_params))
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def first_url_params
    params.require(:first_url).permit(:name).merge(user_id: current_user.id, category_id: @category.id)
  end

  def second_url_params
    params.require(:second_url).permit(:name).merge(user_id: current_user.id, category_id: @category.id)
  end

  def third_url_params
    params.require(:third_url).permit(:name).merge(user_id: current_user.id, category_id: @category.id)
  end

  def scraping_video(url_array)
    require 'open-uri'
    url = url_array.name
    urlId = url[/(?<==)(.*)/]
    doc = Nokogiri::HTML(open(url), nil, "UTF-8")
    url_array['title'] = doc.xpath("//h1['channel-title-container']/span").text.gsub(/\n/, "").gsub(/^\s+/, "").gsub(/\s+$/, "")
    url_array['author'] = doc.xpath("//*[@id='watch7-user-header']/div/a").text
    url_array['thumbnail'] = "https://i.ytimg.com/vi/#{urlId}/default.jpg"
    url_array['subscriber'] = doc.css(".yt-subscription-button-subscriber-count-branded-horizontal").text
    url_array['view'] = doc.css('.watch-view-count').text.gsub(/[^\d]/, "").to_i
    url_array.save
  end
end
