class Project < ActiveRecord::Base

  def wall_area
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


  def total_material_cost
    self.material_cost = (total_sheets_needed * self.sheet_cost)
  end

end

