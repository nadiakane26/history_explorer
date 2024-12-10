module RegionsHelper
    def region_button_color(region)
        case region.name.downcase
        when "northeast" then "btn-outline-primary" # Blue
        when "northwest" then "btn-outline-success" # Green
        when "metro" then "btn-outline-danger"   # Red
        when "southwest" then "btn-outline-warning"  # Yellow
        when "southeast" then "btn-outline-secondary"  # Gray
        when "central" then "btn-outline-info"  # Turquois
        end
      end
end
