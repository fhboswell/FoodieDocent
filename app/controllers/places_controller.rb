

class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]


  def index
    @places = Place.all
 
   
  end

  def show
  end

 
  def new
    @place = Place.new
  end

  def edit
  end

  def create
    @place = Place.new(place_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    
      if @place.update(place_params)
      redirect_to @place, notice: 'Place was successfully updated.' 
        
      else
        render action 'edit' 
       
     
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:description)
    end
end
