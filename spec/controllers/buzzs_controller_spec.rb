require "rails_helper"

RSpec.describe BuzzsController, type: :controller do
  before(:each) do
    @user = User.create!(username: 'exboybeekay', fullname: 'Bello Babakolo')
    @user2 = User.create!(username: 'bello', fullname: 'Bello Babakolo')
  end

  describe "GET index" do
    it "returns a 200" do
      login(@user)
      get :index
      expect(response).to have_http_status(:ok)
    end

    it "renders the index template" do
      login(@user)
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "CREATE buzz" do
    it "redirects to buzzs_url" do
      login(@user2)
      post :create, :params => { :buzz => { :text => "Hello World!" } }
      expect(subject).to redirect_to(buzzs_url)
    end
  end

end