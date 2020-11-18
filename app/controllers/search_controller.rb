class SearchController < ApplicationController

    def index
        puts "You are try to search for #{params[:q]}"
        redirect_to root_path, alert: "No user with '#{params[:q]}' exists"
    end
end
