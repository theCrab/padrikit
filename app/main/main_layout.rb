# MainLayout
class MainLayout < MK::Layout
  def layout
    add UILabel, :remove_me
  end

  def remove_me_style
    text "Hello!"
    background_color UIColor.greenColor
    text_color UIColor.whiteColor
    size_to_fit
    center ["50%", "50%"]
    autoresizing_mask :pin_to_center
  end
end
