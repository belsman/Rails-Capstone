require 'rails_helper'

RSpec.describe "Buzzs", type: :request do
    it "redirects when a user is not logged" do
        get "/buzzs"

        expect(response).to redirect_to(new_session_url)
        follow_redirect!
        expect(response).to render_template("sessions/new")

        post "/sessions", :params => { :user => {:username => "exboybeekay"} }
        expect(response).to redirect_to(buzzs_url)

        expect(response).to render_template(":index")
        expect(response.body).to include("TWEETS")
        expect(response.body).to include("exboybeekay")
    end
end
