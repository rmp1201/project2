class StatisticsController < ApplicationController
  # GET /statistics
  # GET /statistics.json
  def index
    @statistics = Statistic.find(:all)
    @statistic = Statistic.last
      if @statistic == nil || @statistic.created_at.to_date < Date.today
        count = 0.0
        rebooks = 0.0
        Appointment.where("date = ?", Date.yesterday).each do |appointment|
          user = appointment.userID
           appoint = Appointment.where("userID = ?", user).last
           if appoint.created_at.to_date == Date.yesterday
              rebooks += 1.0
           end
           count += 1.0
        end

        count2 = 0
        User.where("admin = ? AND employee = ?", false, false).each do |user|   
          lastAppo = Appointment.where("userID = ?", user.id).last 
          if lastAppo == nil || lastAppo.date < Date.today.months_ago(2) 
            count2 += 1 
          end 
        end 
        if (rebooks/count).nan?
          params[:statistic] = {:rebooks => 0.0 ,:lost => count2 }
        else
         params[:statistic] = {:rebooks => rebooks/count ,:lost => count2 }
        end

        self.create()
      end

  end

  # GET /statistics/1
  # GET /statistics/1.json
  def show
    @statistic = Statistic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @statistic }
    end
  end

  # GET /statistics/new
  # GET /statistics/new.json
  def new
    @statistic = Statistic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @statistic }
    end
  end

  # GET /statistics/1/edit
  def edit
    @statistic = Statistic.find(params[:id])
  end

  # POST /statistics
  # POST /statistics.json
  def create
    @statistic = Statistic.new(params[:statistic])

    respond_to do |format|
      if @statistic.save
        format.html { redirect_to statistics_path, notice: 'Statistic was successfully created.' }
        format.json { render json: statistics_path, status: :created, location: @statistic }
      else
        format.html { render action: "new" }
        format.json { render json: @statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /statistics/1
  # PUT /statistics/1.json
  def update
    @statistic = Statistic.find(params[:id])

    respond_to do |format|
      if @statistic.update_attributes(params[:statistic])
        format.html { redirect_to @statistic, notice: 'Statistic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statistics/1
  # DELETE /statistics/1.json
  def destroy
    @statistic = Statistic.find(params[:id])
    @statistic.destroy

    respond_to do |format|
      format.html { redirect_to statistics_url }
      format.json { head :no_content }
    end
  end
end
