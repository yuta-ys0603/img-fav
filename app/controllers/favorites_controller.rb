# coding: utf-8
class FavoritesController < ApplicationController
  before_action :login?, only: [:favorite, :unfavorite]
  before_action :set_image, only: [:favorite, :unfavorite]
  def favorite
    user_fav = @current_user.favorites.where(favorite_params)
    if !user_fav.empty?
      return redirect_to image_path(id: @image), notice: '既にお気に入りになっています'
    end
    fav = @current_user.favorites.build(favorite_params)
    if fav.save
      return redirect_to image_path(id: @image), notice: 'お気に入りに登録しました'
    else
    end
  end
  def unfavorite
    user_fav = @current_user.favorites.where(favorite_params)
    if user_fav.empty?
      return redirect_to image_path(id: @image), alert: 'お気に入りに登録されていません'
    end
    user_fav[0].destroy
    return redirect_to image_path(id: @image), notice: 'お気に入りから解除しました'
  end
  private
  def favorite_params
    params.require(:favorite).permit(:image_id)
  end
  def set_image
    @image = Image.find(favorite_params[:image_id])
  end
end
