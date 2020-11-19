class BuzzsController < ApplicationController
    before_action :require_login
    layout "buzzer"
    include BuzzsHelper

    def index
        @new_buzz = Buzz.new
        @timeline_buzzs = current_user.timeline_buzzs
        @who_to_follow = current_user.who_to_follow
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
