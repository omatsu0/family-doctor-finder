class Form::Location < Location
  REGISTRABLE_ATTRIBUTES = %i(id address post_address area_id)

  def selectable_areas
    Area.all
  end
end