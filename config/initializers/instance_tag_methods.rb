module ActionView::Helpers::InstanceTagMethods
  remove_const :DEFAULT_TEXT_AREA_OPTIONS
  DEFAULT_TEXT_AREA_OPTIONS = { "cols" => 28, "rows" => 5 }
end