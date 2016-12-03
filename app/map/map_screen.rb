# MapScreen
class MapScreen < PM::MapScreen
  start_position latitude: 53.226340, longitude: -0.545652, radius: 1.5

  def annotation_data
    []
  end

  def on_load
    # @layout = MapLayout.new(root: self.view).build
  end

  def will_appear
    @layout = MapLayout.new(root: mapview).build
    @layout.top_view do
      # something
    end
  end

  def on_appear
    # super
  end
end
