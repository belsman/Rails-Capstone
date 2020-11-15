require 'rails_helper'

RSpec.describe "Users management", type: :request do
    it "signs up User and redirects to the buzz#index's page" do
        get "/users/new"
        expect(response).to render_template(:new)
    
        post "/users", :params => { :user => {:username => "exboybeekay", :fullname => "Bello Babakolo"} }
    
        expect(response).to redirect_to(buzzs_url)
        follow_redirect!
    
        expect(response).to render_template("buzzs/index")
        expect(response.body).to include("TWEETS")
        expect(response.body).to include("WHO TO FOLLOW")
        expect(response.body).to include("BELLO BABAKOLO")
    end
end
