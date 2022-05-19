class BrokersController < ApplicationController
  def index
    @properties = current_user.properties
  end
  def new
  end

  def show
  end
end
