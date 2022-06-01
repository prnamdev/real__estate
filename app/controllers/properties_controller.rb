class PropertiesController < ApplicationController
  load_and_authorize_resource
  before_action :set_property, only: %i[show edit update destroy]

  def index
    @properties = current_user.broker? ? current_user.properties : Property.all
  end

  def show
  end

  def new
    @property = Property.new
  end

  def edit
  end

  def create
    @property = Property.new(property_params.merge(user_id: current_user.id))

    if @property.save
      redirect_to property_url(@property), notice: "Property was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @property.update(property_params)
      redirect_to property_url(@property), notice: "Property was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @property.destroy

    redirect_to properties_url, notice: "Property was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:title, :property_size, :price, :is_deposit_required)
    end
end
