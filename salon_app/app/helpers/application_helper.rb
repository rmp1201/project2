module ApplicationHelper

	# Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "JP's Salon"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def format_time(time)
    if time <= 12
      if time%1 ==0
  		  output= time.to_i.to_s+":00"
  	  else 
  		  time = (time-0.5)
  		  output = time.to_i.to_s+":30"
  	  end
      if time ==12
        output += "pm"
      else
        output += "am"
      end
    else
      if time%1 ==0
        output= (time%12).to_i.to_s+":00pm"
      else 
        time = (time-0.5)
        output = (time%12).to_i.to_s+":30pm"
      end
    end
  end


end
