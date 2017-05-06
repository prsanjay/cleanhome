class Customer < ActiveRecord::Base


  validates :first_name,:last_name,:phone_number, presence: true
  has_many :bookings,:dependent => :destroy

  accepts_nested_attributes_for :bookings,:reject_if => :all_blank, :allow_destroy => true

  def name
    return "#{first_name} #{last_name}"
  end
end
