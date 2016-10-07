class GirlsController < ApplicationController
  def index
    @girls = Girl.all
  end

  def new
    @girl = Girl.new
  end

  def create
    @girl = Girl.new(girl_params)

    if @girl.save
      flash[:success] = "Yea! we have new chick."

      redirect_to girls_path
    else
      render :new
    end
  end

  def girl_params
    params.require(:girl).permit(:name, :password)
  end
end
