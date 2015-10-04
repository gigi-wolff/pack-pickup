module ApplicationHelper

    def display_date(date)
      date.strftime("%m/%d/%Y at %I:%M %P (%a)") unless date==nil #mm/dd/yyy 
    end
end

