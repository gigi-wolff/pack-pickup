module ApplicationHelper

    def display_date(date)
      date.strftime("%m/%d/%Y: %a") unless date==nil #mm/dd/yyy 
    end
end

