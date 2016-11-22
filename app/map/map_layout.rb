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
      add UILabel, :info_label
    end
    # end

    items = %w(Home Work Recent)
    @segmented = UISegmentedControl.alloc.initWithItems(items)
    @request_btn = UIButton.new

    add UIView, :settings_container do
      add @segmented, :settings_segmented_control
      # add @request_btn, :request_step_one
    end
  end

  def info_container_style
    background_color UIColor.whiteColor
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
      border_width 1
      border_color UIColor.greenColor.CGColor
      corner_radius 20
    end

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
  end
end
