require 'rails_helper'

RSpec.describe Project, :type => :model do

  # wall_area
  it "should calculate wall area when given wall height and wall perimiter" do
    wall = Project.create(wall_height: 8, wall_perimiter: 20)
    expect(wall.wall_area).to eq(160)
  end

  # wall_area
  it "should calculate wall area when given wall height and wall perimiter" do
    wall = Project.create(wall_height: 10.0, wall_perimiter: 40.0)
    expect(wall.wall_area).to eq(400)
  end

  # excluded_area
  it "should calculate area of excluded section when given section height and section width" do
    excluded_section_dimensions = Project.create(area_to_exclude_height: 2, area_to_exclude_perimiter: 4)
    expect(excluded_section_dimensions.excluded_area).to eq(8)
  end

  # excluded_area
  it "should calculate area of excluded section when given section height and section width" do
    excluded_section_dimensions = Project.create(area_to_exclude_height: 3.0, area_to_exclude_perimiter: 2.0)
    expect(excluded_section_dimensions.excluded_area).to eq(6)
  end

  # net_area
  it "should calculate net area when given wall_area and excluded_area" do
    wall = Project.create(wall_height: 8, wall_perimiter: 20, area_to_exclude_height: 2, area_to_exclude_perimiter: 4 )
    expect(wall.net_area).to eq(152)
  end

  # net_area
  it "should calculate net area when given wall_area and excluded_area" do
    wall = Project.create(wall_height: 10.0, wall_perimiter: 30.0, area_to_exclude_height: 3.0, area_to_exclude_perimiter: 5.0 )
    expect(wall.net_area).to eq(285)
  end

  # sheet_size
  it "should calculate sheet area when given sheet width and height" do
    sheet_dimensions = Project.create(sheet_width: 4, sheet_height: 8)
    expect(sheet_dimensions.sheet_size).to eq(32)
  end

  # sheet_size
  it "should calculate sheet area when given sheet width and height" do
    sheet_dimensions = Project.create(sheet_width: 4.0, sheet_height: 12.0)
    expect(sheet_dimensions.sheet_size).to eq(48)
  end  

  # total_sheets_needed test
  it "should calculate total sheets needed when passed net area and sheet size" do
    project = Project.create(wall_height: 8, wall_perimiter: 28, area_to_exclude_height: 2, area_to_exclude_perimiter: 4, sheet_width: 4, sheet_height: 8 )
    expect(project.total_sheets_needed).to eq(6)
  end

  # total_sheets_needed 
  it "should calculate total sheets needed when passed net area and sheet size" do
    project = Project.create(wall_height: 10.0, wall_perimiter: 21.0, area_to_exclude_height: 3.0, area_to_exclude_perimiter: 2.0, sheet_width: 4.0, sheet_height: 10.0 )
    expect(project.total_sheets_needed).to eq(5)
  end

  # total_sheets_needed 
  it "should calculate total sheets needed when passed net area and sheet size" do
    project = Project.create(wall_height: 2, wall_perimiter: 4, area_to_exclude_height: 0, area_to_exclude_perimiter: 0, sheet_width: 4, sheet_height: 8 )
    expect(project.total_sheets_needed).to eq(1)
  end


  # total_materials_cost
  it "should calculate total materials cost when given total sheets needed and sheet price" do
    project = Project.create(wall_height: 8, wall_perimiter: 40, area_to_exclude_height: 2, area_to_exclude_perimiter: 4, sheet_width: 4, sheet_height: 8, sheet_cost: 9 )
    expect(project.total_material_cost).to eq(81)
  end

  # total_materials_cost
  it "should calculate total materials cost when given total sheets needed and sheet price" do
    project = Project.create(wall_height: 8, wall_perimiter: 40, area_to_exclude_height: 2, area_to_exclude_perimiter: 4, sheet_width: 4, sheet_height: 8, sheet_cost: 10 )
    expect(project.total_material_cost).to eq(90)
  end



end