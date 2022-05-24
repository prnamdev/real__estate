class InterestsController < ApplicationController
  before_action :find_property
  before_action :find_interest, only: [:destroy]

  def create
    #byebug
    @interest = @property.interests.create(user_id: current_user.id)
    UserMailer.with(user: current_user, property: @property).post_created.deliver_now
    redirect_to property_path(@property)
  end

  def destroy
    #byebug
    @interest.destroy
    redirect_to property_path(@property)
  end

  def interest
    @interests = Interest.where(property_id: @property.id)
  end
  private
    def find_interest
      #byebug
      @interest = @property.interests.find(params[:id])
    end

    def find_property
      #byebug
      @property = Property.find(params[:property_id])
    end
end

