require 'rails_helper'

RSpec.describe 'Users', type: :request do
  it "signs up User and redirects to the buzz#index's page" do
    get '/users/new'
    expect(response).to render_template(:new)

    post '/users', params: { user: { username: 'exboybeekay', fullname: 'Bello Babakolo' } }

    expect(response).to redirect_to(buzzs_url)
    follow_redirect!

    expect(response).to render_template('buzzs/index')
  end
end
