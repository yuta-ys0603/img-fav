require 'rails_helper'

describe FavoritesController, type: :controller do
  context "login user" do
    before :each do
      @user = FactoryGirl.create(:user)
      @image = FactoryGirl.create(:image)
      session[:user_id] = @user.id
    end
    it "favorite image" do
      expect{
        post :favorite, favorite: { image_id: @image.id }
      }.to change(Favorite, :count).by(1)
    end
    it "unfavorite image" do
      FactoryGirl.create(:favorite, user: @user, image: @image)
      expect{
        delete :unfavorite, favorite: { image_id: @image.id }
      }.to change(Favorite, :count).by(-1)
    end
  end
  context "logout user" do
    before :each do
      @image = FactoryGirl.create(:image)
    end
    it "favorite image" do
      post :favorite, favorite: { image_id: @image.id }
      expect(response).to redirect_to sessions_login_path
    end
    it "unfavorite image" do
      delete :unfavorite, favorite: { image_id: @image.id }
      expect(response).to redirect_to sessions_login_path
    end
  end
end
