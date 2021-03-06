class UrlsController < ApplicationController
  def index
    @first_urls = FirstUrl.order("created_at DESC")
    @second_urls = SecondUrl.order("created_at DESC")
    @third_urls = ThirdUrl.order("created_at DESC")
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      if first_url_params['name'] == ''
        flash.now[:alert] = '一番おすすめのURLは必須です。'
        render new_url_path and return
      # スクレイピング
      elsif first_url_params['name'].include?('https://www.youtube.com/watch?v')
        scraping_video(FirstUrl.new(first_url_params))
        if second_url_params['name'].include?('https://www.youtube.com/watch?v') || second_url_params['name'] == ''
          scraping_video(SecondUrl.new(second_url_params))
        else
          blank_creator(SecondUrl.new(third_url_params))
          blank_creator(ThirdUrl.new(third_url_params))
          flash.now[:alert] = 'URLが不適切です'
          render new_url_path and return
        end
        if third_url_params['name'].include?('https://www.youtube.com/watch?v') || third_url_params['name'] == ''
          scraping_video(ThirdUrl.new(third_url_params))
        else
          blank_creator(ThirdUrl.new(third_url_params))
          flash.now[:alert] = 'URLが不適切です'
          render new_url_path and return
        end

        # ポイントの計算
        points_calculator(FirstUrl.select(:name, :title, :author, :thumbnail, :view, :subscriber, :category_id), const=1000)
        points_calculator(SecondUrl.select(:name, :title, :author, :thumbnail, :view, :subscriber, :category_id), const=500)
        points_calculator(ThirdUrl.select(:name, :title, :author, :thumbnail, :view, :subscriber, :category_id), const=300)
        redirect_to root_path, notice: '投稿できました' and return
      else
        flash.now[:alert] = 'URLが不適切です'
        render new_url_path and return
      end
    else
      redirect_to new_url_path, alert: 'カテゴリーを入力してください。' and return
    end
  end

  def search
    @search_categories = Category.where(name: "#{params[:category]}")
    search_category_id = []
    @search_categories.each do |search_category|
      search_category_id.push(search_category.id)
    end
    @urls = TotalPoint.where(category_id: search_category_id).order('point DESC')
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
    if url == ''
      blank_creator(url_array)
    else
      urlId = url[/(?<==)(.*)/]
      doc = Nokogiri::HTML(open(url), nil, "UTF-8")
      url_array['title'] = doc.xpath("//h1['channel-title-container']/span").text.gsub(/\n/, "").gsub(/^\s+/, "").gsub(/\s+$/, "")
      url_array['author'] = doc.xpath("//*[@id='watch7-user-header']/div/a").text
      url_array['thumbnail'] = "https://i.ytimg.com/vi/#{urlId}/default.jpg"
      url_array['subscriber'] = doc.css(".yt-subscription-button-subscriber-count-branded-horizontal").text.gsub(/(\d+)万/){$1}.to_f * 10000
      url_array['view'] = doc.css('.watch-view-count').text.gsub(/[^\d]/, "").to_i
      url_array.save
    end
  end

  def points_calculator(order_youtube_url, const)
    order_youtube_url.each do |url|

      if url.name == ''
      else
        # URLが存在する場合
        @total_point = TotalPoint.find_by(youtube_url: url.name)

        if @total_point then
          # すでに登録済みのURLに対して
          @total_point[:point] += const/(url.view**(1/2.0)+url.subscriber**(1/2.0))
        else
          # 新しいURLに対して
          @total_point = TotalPoint.new
          @total_point[:youtube_url] = url.name
          @total_point[:category_id] = url.category_id
          @total_point[:title] = url.title
          @total_point[:author] = url.author
          @total_point[:thumbnail] = url.thumbnail
          @total_point[:subscriber] = url.subscriber
          @total_point[:view] = url.view
          @total_point[:point] = const/(url.view**(1/2.0)+url.subscriber**(1/2.0))
        end

        @total_point.save
      end
    end
  end

  def blank_creator(url_array)
      url_array['title'] = ''
      url_array['author'] = ''
      url_array['thumbnail'] = ''
      url_array['subscriber'] = ''
      url_array['view'] = ''
      url_array.save
  end

end

