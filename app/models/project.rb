class Project < ActiveRecord::Base

  def wall_area
    return 0 if self.wall_height == nil || self.wall_perimiter == nil
    self.wall_height * self.wall_perimiter
  end

  def excluded_area
    return 0 if self.area_to_exclude_height == nil || self.area_to_exclude_perimiter == nil
    self.area_to_exclude_height * self.area_to_exclude_perimiter
  end

  def net_area
    self.total_sqft = (wall_area - excluded_area)
  end

  def sheet_size
    self.sheet_width * self.sheet_height
  end

  def total_sheets_needed
    self.sheets_needed = (net_area/sheet_size)
  end

  # def sanitize_input
  #   sheet_price = self.sheet_cost
  #   sheet_price.delete('$').to_f
  # end


  # def amount_due=(value)
  #   value = value.to_s.tr('$', '').to_f
  #   write_attribute(:amount_due, value)
  # end

  # def sanitize_input=(value)
  #   value = self.sheet_cost
  #   value = value.to_s.tr('$', '').to_f
  #   write_attribute(:sanitize_input, value)
  # end

  # def sanitize_input
  #   value = self.sheet_cost
  #   value.to_s.tr('$', '').to_f
  #   # return value
  # end

  ## need to round up results also...

  def total_material_cost
    self.material_cost = (total_sheets_needed * self.sheet_cost)
  end



end
