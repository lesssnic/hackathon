class SecureController < ApplicationController
  before_action :authenticate_user!, except: [:index]
end
