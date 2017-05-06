module CleanersHelper
  def checked(city_id,cleaner_id)
    cleaner = CityCleaner.where('city_id=? AND cleaner_id=?',city_id,cleaner_id)
    if cleaner.present?
      return true
    else
      return false
    end
  end
end
