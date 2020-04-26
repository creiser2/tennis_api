class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]
  # GET /matches
  # GET /matches.json

  def index
    @matches = Match.all
    @players = []
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
    mParams = params[:match]
    begin
      @tournament = Tournament.find_by(id: Integer(Tournament.find_by(name: mParams["tournament_id"]).id))
    rescue err
      return
    end

    @match = Match.new("matchtype": mParams[:matchtype])
    @match.tournament = @tournament

    respond_to do |format|
      if @match.save
        if mParams[:matchtype] == "Singles"
          @players = [
            Player.find_by(name: mParams[:firstPlayer]),
            Player.find_by(name: mParams[:secondPlayer])
          ]
        else
          @players = [
            Player.find_by(name: mParams[:firstPlayer]),
            Player.find_by(name: mParams[:secondPlayer]),
            Player.find_by(name: mParams[:thirdPlayer]),
            Player.find_by(name: mParams[:fourthPlayer])
          ]
        end

        @match.players << @players

        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def getPlayersString
    if @match.players
      str = "["
      @match.players do |player|
        str += player.name
        str += ","
      end
      str += "]"
    else
      return "No Players"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def match_params
      params.require(:match).permit(:matchtype, :tournament_id, :players)
    end
end
