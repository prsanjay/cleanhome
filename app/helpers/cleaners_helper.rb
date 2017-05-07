module CleanersHelper
  def checked(city_ids,city_id)
    if city_ids.present?
      return city_ids.include?(city_id)
    else
      return false
    end
  end
end
