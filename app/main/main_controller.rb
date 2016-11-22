# MainScreen
class MainScreen < PM::Screen
  def layout
    @layout ||= MainLayout.new
  end

  def on_load
    self.view = layout.view
  end
end
