class InterestsController < ApplicationController
  before_action :find_interest, only: [:destroy]
  before_action :find_property

  def create
    @property.interests.create(id: current_user)
    UserMailer.with(user: current_user, property: @property).post_created.deliver_now
    redirect_to property_path(@property)
  end
  private

  def find_interest
    @interest = @property.interests.find(params[:id])
  end

  def find_property
    @property = Property.find(params[:property_id])
  end
end
