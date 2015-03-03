class Shusher < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true, 
                   uniqueness: true, 
                   length: {minimum: 5, maximum: 30}
  validates :sound_threshold, presence: true, numericality: { greater_than_or_eqaul_to: 0, less_than_or_equal_to: 100 }
  validates :mac_address, presence: true

  DECAY = 0.20 # decay for Shusher's loudness points calculation
  POLL_INTERVAL = 60 #frequence Shusher polls the web server

  attr_accessor :address
  geocoded_by :ip_address
  after_validation :geocode,
                    :if => lambda{ |obj| obj.ip_address_changed? }
  reverse_geocoded_by :latitude, :longitude
  after_validation :perform_reverse_geocode  # auto-fetch address

  def perform_reverse_geocode
    reverse_geocode
    Rails.logger.info ">>>>>>>>>>> #{address}" #prints out to Rails console
  end

  def decay
    DECAY
  end

  def poll_interval
    POLL_INTERVAL
  end

end
