require 'rails_helper'
RSpec.describe LikesController, type: :controller do
  before do
    @user = create(:user)
    @secret = create(:secret, user: @user)
    @like = create(:like, secret: @secret, user: @user)
  end
  context "when not logged in " do
    before do
      session[:user_id] = nil
    end
    it "cannot create a like" do
      post :create, id: @like
      expect(response).to redirect_to("/sessions/new")
    end
    it "cannot destroy a like" do
      delete :destroy, id: @like
      expect(response).to redirect_to("/sessions/new")
    end
  end
  context "when signed in as the wrong user" do
    before do
      @user2 = create(:user, name: 'benis', email: 'benis@coder.com')
      current_user = @user2
      # session[:user_id] = @user2.id
      # request.env["HTTP_REFERER"] = "/secrets"
    end
    it "shouldn't be able to destroy a like" do
      delete :destroy, id: @secret
      expect{Like.count}.not_to change(Like, :count)
      # OR ...
      # delete :destroy, id: @like.id
      # expect(Like.last).to eq(@like)
    end
  end
end
