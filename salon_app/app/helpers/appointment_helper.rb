module AppointmentHelper

  def setDate(d)
    self.date = d
  end

  def setBeauticianId(id)
    self.beaID = id
  end

  def date=(d)
    @date = d
    render 'table'
  end

  def beaID=(id)
    @beaID = id
  end

  def date
    @date
  end

  def beaID
    @beaID
  end 
	
end
