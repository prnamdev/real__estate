class InterestsController < ApplicationController
  before_action :set_property
  before_action :find_interest, only: :destroy

  def index
    @interests = @property.interests
  end

  def create
    @property.interests.create(user_id: current_user.id)

    UserMailer.with(user: current_user, property: @property).post_created.deliver_now

    redirect_to property_path(@property)
  end

  def destroy
    @interest.destroy

    redirect_to property_path(@property)
  end

  private
    def set_property
      @property = Property.find(params[:property_id])
    end

    def find_interest
      @interest = Interest.find(params[:id])
    end
end

