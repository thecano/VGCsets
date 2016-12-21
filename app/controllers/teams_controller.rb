class TeamsController < ApplicationController
  def new
  	
  end

  def index
  @tops=Top.all.order("fecha desc").page(params[:page]).per(20)
    if params[:teams].present?
    @tops=@tops.where(:country=>params[:teams][:country]).page(params[:page]).per(20) unless params[:teams][:country].blank?
    @tops=@tops.where(:formato=>params[:teams][:formato]).page(params[:page]).per(20) unless params[:teams][:formato].blank?
    @tops=@tops.where(:tipo_torneo=>params[:teams][:tipo_torneo]).page(params[:page]).per(20) unless params[:teams][:tipo_torneo].blank?    
    end
  @Pokes = Pokemon.all.english.order('name')
  end

  def show
  @tops=Top.find(params[:id])
  end

  def filter_pokemon
    if params[:pokemon].present?
    @nombre = Pokemon.find_by(:local_language_id => 9, :pokemon_species_id => params[:pokemon]).name
    @teams=Team.where(:pokemon1_id=>params[:pokemon])+Team.where(:pokemon2_id=>params[:pokemon]) unless params[:pokemon].blank?
    @teams=@teams+Team.where(:pokemon3_id=>params[:pokemon])+Team.where(:pokemon4_id=>params[:pokemon]) unless params[:pokemon].blank?
    @teams=@teams+Team.where(:pokemon5_id=>params[:pokemon])+Team.where(:pokemon6_id=>params[:pokemon]) unless params[:pokemon].blank?
    @teams=@teams.to_a.sort_by(&:fecha).reverse unless params[:pokemon].blank?
    else
    redirect_to '/teams'      
    end 
  end

  def create
  end


  def create_top
  	 redirect_to "/" if !current_user or (!current_user.admin and !current_user.mod)
	@team1=""
	@team2=""
	@team3=""
	@team4=""
	@team5=""
	@team6=""
	@team7=""
	@team8=""

  if !params[:player1].blank?
  	@team = Team.new
  	@team.player_id = params[:player1]
  	@team.pokemon1_id = params[:pokemon11]
  	@team.pokemon2_id = params[:pokemon12]
  	@team.pokemon3_id = params[:pokemon13]
  	@team.pokemon4_id = params[:pokemon14]
  	@team.pokemon5_id = params[:pokemon15]
  	@team.pokemon6_id = params[:pokemon16]
    @team.save
    @team1=@team.id
    end
    if !params[:player2].blank?
    @team = Team.new	
	@team.player_id = params[:player2]
  	@team.pokemon1_id = params[:pokemon21]
  	@team.pokemon2_id = params[:pokemon22]
  	@team.pokemon3_id = params[:pokemon23]
  	@team.pokemon4_id = params[:pokemon24]
  	@team.pokemon5_id = params[:pokemon25]
  	@team.pokemon6_id = params[:pokemon26]
	@team.save
	@team2=@team.id
	end
	if !params[:player3].blank?
	@team = Team.new
	@team.player_id = params[:player3]
  	@team.pokemon1_id = params[:pokemon31]
  	@team.pokemon2_id = params[:pokemon32]
  	@team.pokemon3_id = params[:pokemon33]
  	@team.pokemon4_id = params[:pokemon34]
  	@team.pokemon5_id = params[:pokemon35]
  	@team.pokemon6_id = params[:pokemon36]
    @team.save
    @team3=@team.id
    end
    if !params[:player4].blank?
	@team = Team.new
	@team.player_id = params[:player4]
  	@team.pokemon1_id = params[:pokemon41]
  	@team.pokemon2_id = params[:pokemon42]
  	@team.pokemon3_id = params[:pokemon43]
  	@team.pokemon4_id = params[:pokemon44]
  	@team.pokemon5_id = params[:pokemon45]
  	@team.pokemon6_id = params[:pokemon46]
	@team.save
	@team4=@team.id
	end
	if !params[:player5].blank?
	@team = Team.new
	@team.player_id = params[:player5]
  	@team.pokemon1_id = params[:pokemon51]
  	@team.pokemon2_id = params[:pokemon52]
  	@team.pokemon3_id = params[:pokemon53]
  	@team.pokemon4_id = params[:pokemon54]
  	@team.pokemon5_id = params[:pokemon55]
  	@team.pokemon6_id = params[:pokemon56]
	@team.save
	@team5=@team.id
	end
	if !params[:player6].blank?
  	@team = Team.new
  	@team.player_id = params[:player6]
  	@team.pokemon1_id = params[:pokemon61]
  	@team.pokemon2_id = params[:pokemon62]
  	@team.pokemon3_id = params[:pokemon63]
  	@team.pokemon4_id = params[:pokemon64]
  	@team.pokemon5_id = params[:pokemon65]
  	@team.pokemon6_id = params[:pokemon66]
	@team.save
	@team6=@team.id
	end
	if !params[:player7].blank?
	@team = Team.new
	@team.player_id = params[:player7]
  	@team.pokemon1_id = params[:pokemon71]
  	@team.pokemon2_id = params[:pokemon72]
  	@team.pokemon3_id = params[:pokemon73]
  	@team.pokemon4_id = params[:pokemon74]
  	@team.pokemon5_id = params[:pokemon75]
  	@team.pokemon6_id = params[:pokemon76]
  	@team.save
  	@team7=@team.id
  	end
  	if !params[:player8].blank?
	@team = Team.new
	@team.player_id = params[:player8]
  	@team.pokemon1_id = params[:pokemon81]
  	@team.pokemon2_id = params[:pokemon82]
  	@team.pokemon3_id = params[:pokemon83]
  	@team.pokemon4_id = params[:pokemon84]
  	@team.pokemon5_id = params[:pokemon85]
  	@team.pokemon6_id = params[:pokemon86]
  	@team.save
  	@team8=@team.id
  	end

  	@top=Top.new
  	@top.nombre_torneo = params[:top][:nombre_torneo]
  	@top.tipo_torneo = params[:top][:tipo_torneo]
  	@top.formato = params[:top][:formato]
  	@top.country = params[:top][:country]
  	@top.fecha = DateTime.new(params[:top][:year].to_i, params[:top][:month].to_i, params[:top][:day].to_i)
  	@top.team1_id = @team1
	@top.team2_id = @team2
	@top.team3_id = @team3
	@top.team4_id = @team4
	@top.team5_id = @team5
	@top.team6_id = @team6
	@top.team7_id = @team7
	@top.team8_id = @team8
	redirect_to('/teams') if @top.save
  end

end
