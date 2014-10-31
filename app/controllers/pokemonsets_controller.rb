class PokemonsetsController < ApplicationController
  before_action :set_pokemonset, only: [:show, :edit, :update, :destroy]


before_filter :authorize, :only => [:new]
autocomplete :pokemon, :name, :scopes => [:english]

  def authorize
    redirect_to "/" if !current_user
    flash[:notice] = 'Necesitas iniciar sesión para crear un set'
  end

  
   
  #def load_suggestions
  #logger.info "debugeando"
  #@suggestions = Pokemon.where(:local_language_id => 9).map(&:name) #or MyModel.find(:all, conditions: [...]) #Select the data you want to load on the typeahead.
  #render json: @suggestions
  #end
 

  # GET /pokemonsets
  # GET /pokemonsets.json
  def index
    @pokemonsets = Pokemonset.all.order("created_at desc").page(params[:page]).per(10)
  end

  def best
    @pokemonsets = Pokemonset.all.order(:cached_votes_score => :desc).page(params[:page]).per(10)
    render 'index'
  end
  
  # GET /pokemonsets/1
  # GET /pokemonsets/1.json
  def show
  end

  def search
     
     @existing_species_index = Pokemonset.select(:specie).uniq.page(params[:page]).per(50)
     @existing_pokemon= Pokemon.where(:pokemon_species_id => @existing_species_index).where(:local_language_id => 9).page(params[:page]).per(50)

  end

  def process_search
     name=params[:specie].tr(" ", "-").tr(".", "").tr("'", "").tr("é", "e")
     if name == "Nidoran♂" or name == "nidoran♂"
      name="Nidoran-m"
     elsif name == "Nidoran♀" or name == "nidoran♀"
     name="Nidoran-f"
     end

     logger.info name
     redirect_to "/pokemonsets/specie/"+name
  end
  def specie
    if params[:specie] == "Mr-Mime" or params[:specie] == "Mr-mime" or params[:specie] == "mr-mime"
      params[:specie] = "Mr. Mime"
    elsif params[:specie] == "Mime-Jr" or params[:specie] == "Mime-jr" or params[:specie] == "mime-jr"
    params[:specie] = "Mime Jr."  
    elsif params[:specie] == "Farfetchd" or params[:specie] == "farfetchd"
    params[:specie] = "Farfetch'd"  
    elsif params[:specie] == "Flabebe" or params[:specie] == "flabebe"
    params[:specie] = "Flabébé"
  elsif params[:specie] == "Nidoran-f" or params[:specie] == "nidoran-f"
    params[:specie]= "Nidoran♀"
  elsif params[:specie] == "Nidoran-m" or params[:specie] == "nidoran-m"
    params[:specie]= "Nidoran♂"     
    end
    newname = params[:specie].slice(0,1).capitalize + params[:specie].slice(1..-1)
    @pk_index=Pokemon.where(:name => newname).first
    if @pk_index.nil?
      raise ActionController::RoutingError.new('Not Found')
      return
    end
    @pokemonsets = Pokemonset.where(:specie => @pk_index.id).order(:cached_votes_score => :desc).page(params[:page]).per(10)
    render 'index'
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
