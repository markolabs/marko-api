class EmailController < RocketPants::Base
  def create
    expose params
  end
end
