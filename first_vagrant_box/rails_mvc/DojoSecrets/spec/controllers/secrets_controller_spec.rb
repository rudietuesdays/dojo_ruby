require 'rails_helper'
RSpec.describe SecretsController, type: :controller do
  before do
    @user = create(:user)
    @secret = create(:secret, user: @user)
  end
  context "when not logged in" do
    before do
      session[:user_id] = nil
    end
    it "cannot access index" do
      get :index
      expect(response).to redirect_to("/sessions/new")
    end
    it "cannot access create" do
      post :create
      expect(response).to redirect_to("/sessions/new")
    end
    it "cannot access destroy" do
      delete :destroy, id: @secret
      expect(response).to redirect_to("/sessions/new")
    end
  end
  context "when signed in as the wrong user" do
    before do
      @user2 = create(:user, name: 'benis', email: 'benis@coder.com')
      session[:user_id] = @user2.id
      request.env["HTTP_REFERER"] = "/secrets"
    end
    it "cannot destroy another user's secret" do
      delete :destroy, id: @secret
      expect(response).not_to redirect_to("/users/#{@user.id}")
      # OR ...
      # delete :destroy, id: @secret.id
      # expect(Secret.last).to eq(@secret)
    end
  end
end
