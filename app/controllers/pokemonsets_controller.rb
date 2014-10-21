class PokemonsetsController < ApplicationController
  before_action :set_pokemonset, only: [:show, :edit, :update, :destroy]

  # GET /pokemonsets
  # GET /pokemonsets.json
  def index
    @pokemonsets = Pokemonset.all
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

  # GET /pokemonsets/1/edit
  def edit
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

  # PATCH/PUT /pokemonsets/1
  # PATCH/PUT /pokemonsets/1.json
  def update
    respond_to do |format|
      if @pokemonset.update(pokemonset_params)
        format.html { redirect_to @pokemonset, notice: 'Pokemonset was successfully updated.' }
        format.json { render :show, status: :ok, location: @pokemonset }
      else
        format.html { render :edit }
        format.json { render json: @pokemonset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pokemonsets/1
  # DELETE /pokemonsets/1.json
  def destroy
    @pokemonset.destroy
    respond_to do |format|
      format.html { redirect_to pokemonsets_url, notice: 'Pokemonset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemonset
      @pokemonset = Pokemonset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pokemonset_params
      params.require(:pokemonset).permit(:specie, :hp, :atk, :def, :spatk, :spdef, :spd, :item, :nature, :ability, :move1, :move2, :move3, :move4, :comment)
    end
end
