# LoginScreen
class LoginScreen < PM::Screen
  title "Sp\u00f8ta"

  def layout
    @layout = LoginLayout.new # (root: self.view).build
  end

  def load_view
    # super
    self.view = layout.view

    # self.title = "Twitter"
  end

  def viewDidAppear(animated)
    super
  end
end

# class ChatRoomsScreen < PM::Screen
#   title "Chat Rooms"
#
#   def on_load
#     set_background_color UIColor.blueColor
#   end
# end
# (MotionProvisioning) uk.paxiapp.spota ios development
