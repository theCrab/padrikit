# AppDelegate
# class AppDelegate
#   def application(application, didFinishLaunchingWithOptions: launchOptions)
#     @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
#     root_controller = LoginScreen.alloc.init
#
#     @window.rootViewController = UINavigationController.alloc.initWithRootViewController(root_controller)
#     @window.rootViewController.wantsFullScreenLayout = true
#     @window.makeKeyAndVisible
#
#     true
#   end
# end

# AppDelegate
class AppDelegate < PM::Delegate
  status_bar true, animation: :none
  def on_load(app, options)
    return true if RUBYMOTION_ENV == "test"
    open MapScreen.new
  end
end
