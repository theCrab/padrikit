# MapLayout
class MapLayout < MK::Layout
  # view :info_container
  # view :info_image
  # view :info_label
  #
  # view :settings_container
  # view :settings_segmented_control

  def layout
    # root :map do
    add UIView, :info_container do
      add UIImageView, :info_image
      @infoo = add UILabel, :info_label
    end
    # end

    buttons = button_items.each do |item|
      UIButton.buttonWithType(UIButtonTypeCustom).tap do
        frame(CGRectMake(0.0, 0.0, 40.0, 51.0))
        title(item[:title])
        image(UIImage.imageNamed(item[:gray_image]), forState: UIControlStateNormal) # use gray image
        # image(UIImage.imageNamed(item[:color_image]), forState: UIControlStateHighlighted) # use colored image
        # Move this code to a method
        titleLabel.font = UIFont.systemFontOfSize(9)
        imageEdgeInsets(UIEdgeInsetsMake(-10.0, 10.0, 5.0, 0.0))
        titleEdgeInsets(UIEdgeInsetsMake(15.0, -15.0, 0.0, 0.0))
        contentVerticalAlignment(UIControlContentVerticalAlignmentCenter)
        # backgroundColor(UIColor.blueColor)
      end
    end

    @segmented = UISegmentedControl.alloc.initWithItems(buttons)
    @request_btn = UIButton.new

    add UIView, :settings_container do
      add @segmented, :settings_segmented_control
      add @request_btn, :request_step_one
    end
  end

  def button_items
    # %w(Home Work Recent)
    [
      { title: "Home", gray_image: "home", color_image: "color_home" },
      { title: "Work", gray_image: "work", color_image: "color_work" },
      { title: "Recent", gray_image: "recent_history", color_image: "color_recent_history" }
    ]
  end

  def info_container_style
    background_color UIColor.whiteColor
    layer do
      border_color UIColor.grayColor.CGColor
      border_width 0.5
    end
    constraints do
      x(20)
      top(64)
      right(-20)
      height(50)
    end
  end

  def info_image_style
    image UIImage.imageNamed("work")
    # size_to_fit
    clips_to_bounds true

    constraints do
      top(5)
      left(5)
      width(40)
      height(:scale) # scale height according to width
    end
  end

  def info_label_style
    text("Where to?")
    text_color UIColor.blackColor
    font UIFont.fontWithName("Helvetica Neue", size: 12)
    text_alignment UITextAlignmentLeft

    constraints do
      top(5)
      left.equals(nearest(:info_image), :right).plus(5)
      height(40)
    end
  end

  def settings_container_style
    # background_color UIColor.blackColor
    constraints do
      bottom(0)
      height(100)
      left(10)
      right(-10)
    end
  end

  def settings_segmented_control_style
    background_color UIColor.whiteColor
    layer do
      border_width 0.5
      border_color UIColor.grayColor.CGColor
      corner_radius 20
    end

    items [

    ]
    constraints do
      top(10)
      left(10)
      right(-10)
      height(40)
    end

    # selectedSegmentIndex 0
    addTarget(self, action: "segment_selected", forControlEvents: UIControlEventValueChanged)
  end

  def request_step_one_style
    title "REQUEST"
    title_color UIColor.blackColor
    background_color UIColor.whiteColor
    layer do
      border_width 0.5
      border_color UIColor.grayColor.CGColor
    end

    constraints do
      below(:settings_segmented_control).plus(10)
      center_x.equals(:settings_segmented_control)
      width.equals(:settings_container).times(0.5)
      # height(30)
    end
  end

  def segment_selected
    index = @segmented.selectedSegmentIndex
    mp("Selected index: #{index}")
    # ride              = app_delegate.ride
    @infoo.text =
      case index
      when 0
        "Going Home" # Address.home
      when 1
        "Going to Work" # Address.work
      when 2
        "Going somewhere" # open Favourites.new(nav_bar: true)
      end

    # hide(:settings_container)
    # show(:vehicles_container)
  end
end
