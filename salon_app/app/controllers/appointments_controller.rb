class AppointmentsController < ApplicationController
  def new
  	@appointment = Appointment.new

  	@services = Service.all

  	respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def create
  	@appointment = Appointment.new(params[:appointment])
    if @appointment.save
      flash[:alert] = "Appointment has been made!"
      redirect_to user_path(@appointment.userID)
    else
      flash[:alert] = @appointment.beauticianID
      render 'new'
    end
  end

  def edit
  end

  def delete
  end

  def getAppoitnments
      Appointment.where("date == ? AND beauticianID == ?", params[:date], params[:beaID])
  end

end