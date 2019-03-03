class DosesController < ApplicationController

  def new
  	@cocktail = Cocktail.find(params[:cocktail_id])
  	# we need @cocktail in the simple_form_for !
  	@dose = Dose.new
  end

  def create
  	@dose = Dose.new(dose_params)
  	@cocktail = Cocktail.find(params[:cocktail_id])
  	@dose.cocktail = @cocktail
  	# THIS IS ESSENTIA -> assocating both DB from active records
  	if @dose.save
  		redirect_to cocktail_path(@cocktail)
  	else
  		render :new
  	end
    # we need `cocktail_id` to asssociate dose with corresponding cocktail
  end

  # new and create -> @cocktail = Cocktail.find(params[:cocktail_id]) avoid by using before-action!

  def destroy
  	@dose = Dose.find(params[:id])
  	@dose.destroy
  	redirect_to cocktail_path(params[:cocktail_id])
  	# redirect_to cocktail_path(@dose.cocktail)
  	# alternative for cocktail_path(@cocktail) since not known
  	# cocktail GET    /cocktails/:id(.:format)
  	# cocktail_dose DELETE /cocktails/:cocktail_id/doses/:id(.:format)
  end

  private 

  def dose_params
  	params.require(:dose).permit(:description, :ingredient_id)
  	# get info via inspect HTML CHECK HTML: FORM = (name: dose[ingredient_id])
  	# in the form new -> f.association :ingrediet NOT ingredient_id
  	# note: ingredient_id is how it is in the DB of doses
  end

end
