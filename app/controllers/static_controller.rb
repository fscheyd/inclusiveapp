class StaticController < ApplicationController
    def home
        redirect_to "/login"
    end
end