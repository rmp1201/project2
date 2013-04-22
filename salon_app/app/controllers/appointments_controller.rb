class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.where("date >= ?", Date.today)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

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
      redirect_to user_path(current_user.id)
    else
      render 'new'
    end
  end

  def edit
  end

  def delete
  end

  def table
    if  params[:date] && params[:date] != "undefined" 
      @date = Date.parse params[:date]
    end
    if params[:beaID] && params[:beaID] != "undefined" 
      @beaID = params[:beaID]
    end
    
    
    render :partial => 'appointments/table'

  end

  def destroy
      Appointment.find(params[:id]).destroy
      redirect_to user_path
  end


end