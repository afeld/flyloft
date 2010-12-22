Time::DATE_FORMATS.merge!(
  :default => '%b %e, %Y',
  :short => '%a, %b %e',
  :short_with_time => '%a, %b %e %l:%M%p',
  :date => '%a, %b %e, %Y',
  :time => '%l:%M%p'
)
Date::DATE_FORMATS.merge!(
  :default => '%b %e, %Y',
  :short => '%a, %b %e'
)