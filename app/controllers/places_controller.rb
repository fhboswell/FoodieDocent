

class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy ]
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @places = Place.all
 
   
  end

  def show
  end

 
  def new
    @place = current_user.places.build
  end

  def edit
  end

  def create
    @place = current_user.places.build(place_params)

    
    if @place.save
      redirect_to @place, notice: 'Place was successfully created.'
      
    else
      render action: 'new'
      
    end
   
  end

  def update
    
    if @place.update(place_params)
    redirect_to @place, notice: 'Place was successfully updated.' 
      
    else
      render action: 'edit' 
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    
      redirect_to places_url, notice: 'Place was successfully destroyed.' 
     
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    def correct_user
      @place = current_user.places.find_by(id: params[:id])
      redirect_to places_path, notice: "Cant Edit" if @place.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:description, :image)
    end
end
