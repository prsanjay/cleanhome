class CityCleaner < ActiveRecord::Base
  belongs_to :city
  belongs_to :cleaner
end
