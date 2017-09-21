class PokemonsetsController < ApplicationController
  before_action :set_pokemonset, only: [:show, :edit, :update, :destroy]
 


before_action :authorize, :only => [:new]
before_action :set_language
  def authorize
    redirect_to "/" if !current_user
    flash[:notice] = t(:login_required)
  end

def set_language
    if I18n.locale == :en
    @language = 9 
    else
    @language = 7
    end
end
   
  #def load_suggestions
  #logger.info "debugeando"
  #@suggestions = Pokemon.where(:local_language_id => 9).map(&:name) #or MyModel.find(:all, conditions: [...]) #Select the data you want to load on the typeahead.
  #render json: @suggestions
  #end
 


  # GET /pokemonsets
  # GET /pokemonsets.json
  def index
    @pokemonsets = Pokemonset.where(:formato=>'VGC17').order("created_at desc").page(params[:page]).per(9)
    @titulo=t("title.index")
  end

  def best
    @pokemonsets = Pokemonset.where(:formato=>'VGC17').order(:cached_votes_score => :desc).page(params[:page]).per(10)
   @titulo=t("top_rated")
   render 'index'
  end
  
  # GET /pokemonsets/1
  # GET /pokemonsets/1.json
  def show
    specie_index=Pokemonset.find(params[:id])
    @specie=Pokemon.find(specie_index.specie)
   
  end
  
  def about
  end
  
  def search
     
    @sets = Pokemonset.where(:formato=>'VGC17')
    @unique_index = @sets.map{|t| t.specie}.uniq 
    @existing_pokemon= Pokemon.where(:pokemon_species_id => @unique_index).where(:local_language_id => 9).order(:pokemon_species_id => :asc).page(params[:page]).per(43)

  end

  def process_search
    
    aux_sets=Pokemonset.where(:formato=>'VGC17').page(params[:page]).per(10)
    aux_sets=aux_sets.where(:specie => params[:specie][:id]).order(:cached_votes_score => :desc).page(params[:page]).per(10) unless params[:specie][:id].blank?    
    aux_sets=aux_sets.where(:item => params[:item][:id]).order(:cached_votes_score => :desc).page(params[:page]).per(10) unless params[:item][:id].blank?  
    aux_sets=aux_sets.where(:nature => params[:nature][:id]).order(:cached_votes_score => :desc).page(params[:page]).per(10) unless params[:nature][:id].blank?  
    aux_sets=aux_sets.where(:ability => params[:ability][:id]).order(:cached_votes_score => :desc).page(params[:page]).per(10) unless params[:ability][:id].blank?  
    @pokemonsets=aux_sets
	  @titulo=t "title.search"
   
    render "index"
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
    #@poke_stats= Stats.where(:pokemon_id => @pk_index.id)
    #@arreglo=[]
    #@arreglo.push([ "Hp" , @poke_stats[0].base_stat ] )
    #@arreglo.push(["Atk",@poke_stats[1].base_stat])
    #@arreglo.push(["Def",@poke_stats[2].base_stat])
    #@arreglo.push(["Sp.Atk",@poke_stats[3].base_stat])
    #@arreglo.push(["Sp.Def",@poke_stats[4].base_stat])
    #@arreglo.push(["Spd",@poke_stats[5].base_stat])
    
    @pokemonsets = Pokemonset.where(:formato=>'VGC17').where(:specie => @pk_index.id).order(:cached_votes_score => :desc).page(params[:page]).per(10)
   	@titulo = t("title.specie")+newname
	 render 'index'
  end

  def VGC15
  @pokemonsets = Pokemonset.where(:formato=>'VGC15').order("created_at desc").page(params[:page]).per(10)
    @titulo=t("title.index")
    render 'index'
  end
  def VGC16
  @pokemonsets = Pokemonset.where(:formato=>'VGC16').order("created_at desc").page(params[:page]).per(10)
    @titulo=t("title.index")
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
    @creator= User.find(@pokemonset.creator)
    if @pokemonset.hp == 0
      @pokemonset.hp=nil
    end
    if @pokemonset.atk == 0
      @pokemonset.atk=nil
    end
    if @pokemonset.defe == 0
      @pokemonset.defe=nil
    end
    if @pokemonset.spatk == 0
      @pokemonset.spatk=nil
    end
    if @pokemonset.spdef == 0
      @pokemonset.spdef=nil
    end
    if @pokemonset.spd == 0
      @pokemonset.spd=nil
    end
    respond_to do |format|
      if @pokemonset.save and @creator.banned != true
        format.html { redirect_to @pokemonset, notice: 'Pokemonset was successfully created.' }
        format.json { render :show, status: :created, location: @pokemonset }
      else
        format.html { render :new }
        format.json { render json: @pokemonset.errors, status: :unprocessable_entity }
      end
    end
  end

  
    def edit
      if current_user.id==Pokemonset.find(params[:id]).creator
      @pokemonset = Pokemonset.find(params[:id])
      else redirect_to "/"
      end
    end

  # PATCH/PUT /pokemonsets/1
  # PATCH/PUT /pokemonsets/1.json
  def update
   respond_to do |format|
        if @pokemonset.update(pokemonset_params)
          format.html { redirect_to @pokemonset, notice: 'Set actualizado.' }
        format.json { render :show, status: :ok, location: @pokemonset }
        else
        format.html { render :edit }
          format.json { render json: @pokemonset.errors, status: :unprocessable_entity }
        end
    end
  end

  def likes
  @pokemonset = Pokemonset.find(params[:id])
  @pokemonset.liked_by current_user
  respond_to do |format|
    format.js
              end
  end
  def dislikes
  @pokemonset = Pokemonset.find(params[:id])
  @pokemonset.disliked_by current_user
  respond_to do |format|
    
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
      params.require(:pokemonset).permit(:title,:active,:specie, :hp, :atk, :defe, :spatk, :spdef, :spd, :item, :nature, :ability, :move1, :move2, :move3, :move4, :comment,:creator,:lang)
    end
end
