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
    if (net_area/sheet_size) < 1
      return 1
    else
      self.sheets_needed = (net_area/sheet_size)
    end
  end

  def sanitize_input
    self.sheet_cost = self.sheet_cost.tr('$', ' ').to_f
    # return value
  end

  def total_material_cost
    self.material_cost = (total_sheets_needed * self.sheet_cost)
  end

  def calculate_everything
    # sanitize_input
    net_area
    total_sheets_needed
    total_material_cost
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


  ## need to round up results also...




end
