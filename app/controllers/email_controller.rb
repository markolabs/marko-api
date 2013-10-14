class EmailController < RocketPants::Base
  def show
    expose "hello there"
  end

  def create
    expose params
  end
end
