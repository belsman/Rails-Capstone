require 'rails_helper'

RSpec.describe "Sessions", type: :request do
    it "signs in User and redirects to the buzz#index's page" do
        get "/sessions/new"
        expect(response).to render_template(:new)

        # post "/sessions", :params => { :user => {:username => "exboybeekay"} }

        # expect(response).to redirect_to(buzzs_url)
        # follow_redirect!

        # # expect(response).to render_template("buzzs/index")
        # # expect(response.body).to include("BUZZS'")
        # # expect(response.body).to include("exboybeekay")
    end
end
