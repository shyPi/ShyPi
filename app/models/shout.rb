class Shout < ActiveRecord::Base
  has_many :shushers, dependent: :nullify

  validates :filename, presence: true

end
