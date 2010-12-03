module Locatable
  def location
    [self.city, self.state].compact.join ", "
  end
end
