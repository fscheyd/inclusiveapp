class BusinessesController < ApplicationController
    has_many :reveiws
    has_many :users, through :reveiws
end
