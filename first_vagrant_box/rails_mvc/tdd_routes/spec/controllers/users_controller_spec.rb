require 'rails_helper'

RSpec.describe UsersController do
  describe "GET #index" do #this only works if u used resources :users to set up routes ; can also use --> get "/users"
    it "renders the :index view" do
        get :index
        expect(response).to render_template :index
    end
  end
  describe "GET #show" do
    it "assigns the requested user to @user" do
        user = create(:user)
      get :show, params: { id: user.id }
        assigns(:user).to eq(user)
    end
    it "renders the :show template" do
        user = create(:user)
      get :show, params: { id: user.id }
        expect(response).to render_template("show")
    end
  end
  describe "Post #create" do
    post :create, user: build(:user)
    expect(response).to eq("/users/#{User.last.id}")
  end
  describe "Delete #destroy" do
     user = create(:user)
     delete :destroy, params: {id: user}
     expect(response).to be_success
   end
end


# routes practice:
# describe UsersController, type: :controller do
#   it "routes /users to the users controller" do
#     expect(:get => "/users/index").to route_to(:controller => "users", :action => "index")
#   end
#
#   it "routes /users/:id to users profile" do
#     expect(:get => "/users/1").to route_to(:controller => "users", :action => "show", :id => "1")
#   end
# end

# the following lines are auto-generated:

# RSpec.describe UsersController, type: :controller do
#
#   describe "GET #index" do
#     it "returns http success" do
#       get :index
#       expect(response).to have_http_status(:success)
#     end
#   end
#
#   describe "GET #create" do
#     it "returns http success" do
#       get :create
#       expect(response).to have_http_status(:success)
#     end
#   end
#
#   describe "GET #new" do
#     it "returns http success" do
#       get :new
#       expect(response).to have_http_status(:success)
#     end
#   end
#
# end
