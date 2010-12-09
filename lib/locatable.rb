module Locatable
  def location
    [self.city, self.state].delete_if{|o| o.blank? }.join ", "
  end
end
