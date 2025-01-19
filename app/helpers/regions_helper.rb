module RegionsHelper
  def region_color(region)
    case region.name.downcase
    when "northeast" then "primary" # Blue
    when "northwest" then "success" # Green
    when "metro" then "danger"   # Red
    when "southwest" then "warning"  # Yellow
    when "southeast" then "secondary"  # Gray
    when "central" then "info"  # Turquois
    end
  end
end
