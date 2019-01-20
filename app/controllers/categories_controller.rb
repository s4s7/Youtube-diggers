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
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end
end
