class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path, notice: "ユーザー名が変更されました。"
    else
      flash.now[:alert] = "ユーザー名を入力してください"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
