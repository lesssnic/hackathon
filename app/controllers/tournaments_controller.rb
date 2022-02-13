class TournamentsController < SecureController
  before_action :authorize_tournament!, except: [:index]
  after_action :verify_authorized, except: [:index]

  def index
    @tournament = Tournament.all
  end

  def create
    @tournament = Tournament.new(tournament_params)
    if @tournament.save
      render json: @tournament
    else
      render json: @tournament.errors
    end
  end

  def tournament_params
    params.require(:tournament).permit(:mode, :name, :scenario, :participants, :description, :place)
  end

  def authorize_tournament!
    authorize(@tournament || Tournament)
  end
end
