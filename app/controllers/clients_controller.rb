class ClientsController < ApplicationController
  def index
    @properties = Property.all
  end
end
