# MapScreen
class MapScreen < PM::MapScreen
  start_position latitude: 53.226340, longitude: -0.545652, radius: 1.5

  def annotation_data
    []
  end

  def on_load
    # @layout = MapLayout.new(root: self.view).build
  end

  def layout
    @layout = MapLayout.new
  end

  def will_appear
    add(layout.view)
  end

  def on_appear
    # super
  end
end
