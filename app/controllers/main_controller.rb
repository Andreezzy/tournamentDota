class MainController < ApplicationController
	before_action :authenticate_user!, only: [:check_ticket]
  def home
  end
  def inscripcion
  	if authenticate_user!
	  	flash[:alert] = "NO ESTAS REGISTRADO REGISTRATE"
  	end
  end
  def check_ticket
  	@key = Key.find_by(des: params.require(:key).permit(:des)[:des])
  	if @key.nil? || !@key.active
  		flash[:alert] = "TICKET NO VALIDO"
  		render :inscripcion
  	end
  	#@key.update(active: false)
  	@team = Team.new
  end
end
