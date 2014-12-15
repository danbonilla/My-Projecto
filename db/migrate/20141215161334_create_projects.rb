class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :wall_height
      t.integer :wall_perimiter
      t.integer :area_to_exclude_height
      t.integer :area_to_exclude_perimiter
      t.integer :sheet_height
      t.integer :sheet_width
      t.integer :sheet_cost
      t.integer :total_sqft
      t.integer :sheets_needed
      t.integer :material_cost
    end
  end
end
