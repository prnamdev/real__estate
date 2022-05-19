class ClientsController < ApplicationController
  def index
    @properties = Property.all
  end
  def new
  end
end
