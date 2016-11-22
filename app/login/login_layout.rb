# LoginLayout
class LoginLayout < MK::Layout
  view :username_field
  view :submit_button

  def layout
    background_color UIColor.whiteColor

    add UIView, :login_container do
      add UITextField, :username_field
      add UITextField, :password_field
      add UIButton, :submit_button
    end

    items = %w(Login Register)
    @segmented = UISegmentedControl.alloc.initWithItems(items)
    add @segmented, :segmented
  end

  def login_container_style
    initial do
      layer do
        corner_radius 2.5
      end
      background_color UIColor.grayColor

      constraints do
        x(10)
        # width.equals(:superview).minus(10)
        right(-10)
        height(140)
        center_y.equals(:superview)
        # bottom(-10)
      end
    end
  end

  def segmented_style
    background_color UIColor.clearColor

    constraints do
      width.equals(:login_container)
      center_x.equals(:superview)
      above(:login_container).minus(10)
    end

    selectedSegmentIndex 0
    addTarget(self, action: "segment_selected", forControlEvents: UIControlEventValueChanged)
  end

  def segment_selected
    index = @segmented.selectedSegmentIndex
    mp("Selected index: #{index}")
  end

  def username_field_style
    layer do
      # border_width 0.5
      # border_color UIColor.grayColor.CGColor
      # corner_radius 2.5
    end

    placeholder "Username"

    border_style UITextBorderStyleRoundedRect
    keyboard_type UIKeyboardTypeEmailAddress
    autocorrection_type UITextAutocorrectionTypeNo
    spellChecking_type UITextSpellCheckingTypeNo
    autocapitalization_type UITextAutocapitalizationTypeNone

    constraints do
      left(10)
      right(-10)
      top(10)
      height(30)
    end
  end

  def password_field_style
    layer do
      # border_width 1
      # corner_radius 2.5
    end

    placeholder "Password"

    border_style UITextBorderStyleRoundedRect
    autocorrection_type UITextAutocorrectionTypeNo
    spellChecking_type UITextSpellCheckingTypeNo
    autocapitalization_type UITextAutocapitalizationTypeNone
    secure_text_entry true

    constraints do
      below(:username_field).plus(10)
      width.equals(:username_field)
      left(10)
      right(-10)
      height(30)
    end
  end

  def submit_button_style
    title "Login"
    title_color UIColor.whiteColor
    background_color UIColor.clearColor

    layer do
      border_width 1
      border_color UIColor.greenColor.CGColor
      corner_radius 2.5
    end

    constraints do
      below(:password_field).plus(10)
      width.equals(:password_field)
      left(10)
      right(-10)
    end
  end

  # def label_style
  #   text "USERNAME"
  #   numberOfLines 2
  #   font UIFont.boldSystemFontOfSize(30)
  #   textColor UIColor.blackColor
  #   textAlignment UITextAlignmentCenter
  #   constraints do
  #     width "100% - 20"
  #     center_x.equals(:superview)
  #     # above(top_la)
  #   end
  # end
end
