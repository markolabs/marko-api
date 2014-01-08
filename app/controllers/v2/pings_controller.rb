class V2::PingsController < V2::ApiController
  before_filter :require_login

  def create
    params[:ping][:background] = true

    ping = Ping.create!(params[:ping])
    expose ping
  end
end
