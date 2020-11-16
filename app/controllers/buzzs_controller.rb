class BuzzsController < ApplicationController
    include BuzzsHelper

    def index
        @new_buzz = Buzz.new
        @timeline_buzzs = current_user.buzzs
    end

    def create
        @buzz = current_user.buzzs.new(buzzs_params)

        if @buzz.save
          redirect_to buzzs_path, notice: 'Buzz was successfully created.'
        else
            @timeline_buzzs = current_user.buzzs
            render :index, alert: 'Buzz was not created.'
        end
    end
end
