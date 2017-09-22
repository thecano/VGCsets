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
    @nombre = Pokemon.find_by(:local_language_id => 9, :pokemon_species_id => params[:pokemon])
    @teams=Team.where(:pokemon1_id=>params[:pokemon])+Team.where(:pokemon2_id=>params[:pokemon]) unless params[:pokemon].blank?
    @teams=@teams+Team.where(:pokemon3_id=>params[:pokemon])+Team.where(:pokemon4_id=>params[:pokemon]) unless params[:pokemon].blank?
    @teams=@teams+Team.where(:pokemon5_id=>params[:pokemon])+Team.where(:pokemon6_id=>params[:pokemon]) unless params[:pokemon].blank?
    @teams=@teams.to_a.sort_by(&:fecha).reverse unless params[:pokemon].blank?
    @teams = Kaminari.paginate_array(@teams).page(params[:page]).per(10)
    elsif params[:search].present?
    search = params[:search].slice(0,1).capitalize + params[:search].slice(1..-1)
    search = search.gsub ' alola', '-Alola'
    search = search.gsub ' Alola', '-Alola'
    search = search.gsub '-alola', '-Alola'
    search = search.gsub ' koko', ' Koko'
    search = search.gsub ' fini', ' Fini'
    search = search.gsub ' bulu', ' Bulu'
    search = search.gsub ' lele', ' Lele'
    @nombre = Pokemon.find_by(:local_language_id => 9, :name => search)
      if @nombre.blank?
      redirect_to '/teams'
      flash[:notice]="yes"
      return          
      end
    @teams=Team.where(:pokemon1_id=>@nombre.id)+Team.where(:pokemon2_id=>@nombre.id) unless params[:search].blank?
    @teams=@teams+Team.where(:pokemon3_id=>@nombre.id)+Team.where(:pokemon4_id=>@nombre.id) unless params[:search].blank?
    @teams=@teams+Team.where(:pokemon5_id=>@nombre.id)+Team.where(:pokemon6_id=>@nombre.id) unless params[:search].blank?
    @teams=@teams.to_a.sort_by(&:fecha).reverse unless params[:search].blank?
    @teams = Kaminari.paginate_array(@teams).page(params[:page]).per(10)
    else  
    redirect_to '/teams'      
    end 
  end

  def create
  end

  def edit
  redirect_to "/" if !current_user or (!current_user.admin and !current_user.mod)
  @team=Team.find(params[:id])
  end
  
  def update  
      @team=Team.find(params[:id])
      if @team.update(team_params)
         redirect_to '/teams', notice: 'Player was successfully created.'
      else
        render :edit
      end
  end

  def stats

    if params.has_key?(:teams)
      if params[:teams][:range].to_i==0
        teams = Top.where(:formato => 'VGC17')
      else
        teams = Top.where(:formato => 'VGC17').where(:fecha=>DateTime.now-params[:teams][:range].to_i..DateTime.now)
      end
    else 
        teams = Top.where(:formato => 'VGC17')
    end
    if params.has_key?(:teams) and params[:teams][:country].present? and !params[:teams][:country].blank?
    teams = teams.where(:country=>params[:teams][:country])
    end
    if params.has_key?(:teams) and params[:teams][:category].present? and !params[:teams][:category].blank? and params[:teams][:category].to_i == 1  
    teams = teams.where.not(:tipo_torneo => 'Premier')
    end
    teams=teams.pluck(:team1_id,:team2_id,:team3_id,:team4_id,:team5_id,:team6_id,:team7_id,:team8_id)
    teams = teams.flatten
    teams = teams.compact
    @pokes = Team.where(:id=>teams).pluck(:pokemon1_id,:pokemon2_id,:pokemon3_id,:pokemon4_id,:pokemon5_id,:pokemon6_id)
    @pokes = @pokes.flatten
    @pokes = @pokes.compact
    @tamanio = @pokes.size/6
    @pokes = @pokes.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 }
    @pokes.except!(834)
    @pokes = @pokes.sort_by { |poke, cantidad| cantidad }.reverse
    @pokes = Kaminari.paginate_array(@pokes).page(params[:page]).per(21)
    if params[:page].blank?
      pagina=1
    else
      pagina=params[:page].to_i
    end
    @cont = 21*(pagina-1)+1
  end
  
  def create_single
    redirect_to "/" if !current_user or (!current_user.admin and !current_user.mod)
    @team = Team.new
    @team.player_id = params[:player]
    @team.pokemon1_id = params[:pokemon1]
    @team.pokemon2_id = params[:pokemon2]
    @team.pokemon3_id = params[:pokemon3]
    @team.pokemon4_id = params[:pokemon4]
    @team.pokemon5_id = params[:pokemon5]
    @team.pokemon6_id = params[:pokemon6]
    @team.desc = params[:team][:desc]
    if @team.save
      redirect_to '/players/'+params[:player].to_s
    end
    
  end

  def new_single
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

  def team_params
      params.require(:team).permit(:player_id, :pokemon1_id, :pokemon2_id, :pokemon3_id, :pokemon4_id, :pokemon5_id, :pokemon6_id)
    end

end
