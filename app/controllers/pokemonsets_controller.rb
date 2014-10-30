class PokemonsetsController < ApplicationController
  before_action :set_pokemonset, only: [:show, :edit, :update, :destroy]


before_filter :authorize, :only => [:new]

  def authorize
    redirect_to "/" if !current_user
    flash[:notice] = 'Necesitas iniciar sesión para crear un set'
  end
  

  # GET /pokemonsets
  # GET /pokemonsets.json
  def index
    @pokemonsets = Pokemonset.all.order("created_at desc").page(params[:page]).per(2)
  end

  def best
    @pokemonsets = Pokemonset.all.order(:cached_weighted_average => :desc)
  end
  # GET /pokemonsets/1
  # GET /pokemonsets/1.json
  def show
  end

  # GET /pokemonsets/new
  def new
    #@species=Pokemon_specie.all
    @pokemonset = Pokemonset.new
  end

  

  # POST /pokemonsets
  # POST /pokemonsets.json
  def create
    @pokemonset = Pokemonset.new(pokemonset_params)

    respond_to do |format|
      if @pokemonset.save
        format.html { redirect_to @pokemonset, notice: 'Pokemonset was successfully created.' }
        format.json { render :show, status: :created, location: @pokemonset }
      else
        format.html { render :new }
        format.json { render json: @pokemonset.errors, status: :unprocessable_entity }
      end
    end
  end

  


  def likes
  @pokemonset = Pokemonset.find(params[:id])
  @pokemonset.liked_by current_user
  respond_to do |format|
    format.html {redirect_to :back}
    format.js
              end
  end
  def dislikes
  @pokemonset = Pokemonset.find(params[:id])
  @pokemonset.disliked_by current_user
  respond_to do |format|
    format.html {redirect_to :back}
    format.js
              end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemonset
      @pokemonset = Pokemonset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pokemonset_params
      params.require(:pokemonset).permit(:title,:active,:specie, :hp, :atk, :def, :spatk, :spdef, :spd, :item, :nature, :ability, :move1, :move2, :move3, :move4, :comment)
    end
end
