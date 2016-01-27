module GroupsHelper

  def group_type(value)
    value = value[:group_type].to_i
    if value == 1
      return "Veterinarian"
    elsif value == 2
      return "Technician"
    elsif value == 3
      return "Front Desk"
    else
      flash[:error] = "Incorrect value was chosen"
    end
  end

end
