class CocktailsController < ApplicationController
  def index
    if params[:query].present?
      @cocktails = Cocktail.where('name ILIKE ?', "%#{params[:query]}%" )
    else
      @cocktails = Cocktail.all
    end
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def custom

    @cocktails = Cocktail.all
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
