class CategoriesController < ApplicationController

    def create

    #category
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

    #first_url
    @first_url = FirstUrl.new(first_url_params)
    first_url = @first_url.name
    first_urlId = first_url[/(?<==)(.*)/]
    first_doc = Nokogiri::HTML(open(first_url), nil, "UTF-8")

    @first_url['title'] = first_doc.xpath("//h1['channel-title-container']/span").text.gsub(/\n/, "").gsub(/^\s+/, "").gsub(/\s+$/, "")
    @first_url['author'] = first_doc.xpath("//*[@id='watch7-user-header']/div/a").text
    @first_url['thumbnail'] = "https://i.ytimg.com/vi/#{first_urlId}/default.jpg"
    @first_url['subscriber'] = first_doc.css(".yt-subscription-button-subscriber-count-branded-horizontal").text
    @first_url['view'] = first_doc.css('.watch-view-count').text.gsub(/[^\d]/, "").to_i
    @first_url.save

    #second_url
    @second_url = SecondUrl.new(second_url_params)
    second_url = @second_url.name
    second_urlId = second_url[/(?<==)(.*)/]
    second_doc = Nokogiri::HTML(open(second_url), nil, "UTF-8")

    @second_url['title'] = second_doc.xpath("//h1['channel-title-container']/span").text.gsub(/\n/, "").gsub(/^\s+/, "").gsub(/\s+$/, "")
    @second_url['author'] = second_doc.xpath("//*[@id='watch7-user-header']/div/a").text
    @second_url['thumbnail'] = "https://i.ytimg.com/vi/#{second_urlId}/default.jpg"
    @second_url['subscriber'] = second_doc.css(".yt-subscription-button-subscriber-count-branded-horizontal").text
    @second_url['view'] = second_doc.css('.watch-view-count').text.gsub(/[^\d]/, "").to_i
    @second_url.save

    #third_url
    @third_url = ThirdUrl.new(third_url_params)
    third_url = @third_url.name
    third_urlId = third_url[/(?<==)(.*)/]
    third_doc = Nokogiri::HTML(open(third_url), nil, "UTF-8")

    @third_url['title'] = third_doc.xpath("//h1['channel-title-container']/span").text.gsub(/\n/, "").gsub(/^\s+/, "").gsub(/\s+$/, "")
    @third_url['author'] = third_doc.xpath("//*[@id='watch7-user-header']/div/a").text
    @third_url['thumbnail'] = "https://i.ytimg.com/vi/#{third_urlId}/default.jpg"
    @third_url['subscriber'] = third_doc.css(".yt-subscription-button-subscriber-count-branded-horizontal").text
    @third_url['view'] = third_doc.css('.watch-view-count').text.gsub(/[^\d]/, "").to_i
    @third_url.save
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
end
