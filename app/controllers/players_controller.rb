class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players
  # GET /players.json
  def index
    @players = Player.order(:name).page(params[:page]).per(20)
    if params[:player].present?
    @players=@players.where(:country=>params[:player][:country]).page(params[:page]).per(20)    
    end
  end

  # GET /players/1
  # GET /players/1.json
  def show
  end

  def recursos_new
    redirect_to "/" if !current_user or (!current_user.admin and !current_user.mod)
  end
  def recursos_create
    redirect_to "/" if !current_user or (!current_user.admin and !current_user.mod)
    @recurso=Recurso.new
    @recurso.url=params[:recurso][:texto]
    @recurso.descripcion=params[:recurso][:descripcion]
    @recurso.team_id=params[:id]
    redirect_to "/players" if @recurso.save

  end
  # GET /players/new
  def new
     redirect_to "/" if !current_user or (!current_user.admin and !current_user.mod)
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
    redirect_to "/" if !current_user or (!current_user.admin and !current_user.mod)
  end

  # POST /players
  # POST /players.json
  def create
     redirect_to "/" if !current_user or (!current_user.admin and !current_user.mod)
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
     redirect_to "/" if !current_user or (!current_user.admin and !current_user.mod)
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  #def destroy
  #  @player.destroy
  #  respond_to do |format|
  #    format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
  #    format.json { head :no_content }
  #  end
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:name, :nickname, :country, :facebook, :twitter, :youtube, :blog)
    end
end
