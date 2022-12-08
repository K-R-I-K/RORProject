class Student < ApplicationRecord
  belongs_to :winter_session
  validates :lastname, presence: true
  validates :group, presence: true
  validates :winter_session_id, presence: true
  validates :geom, presence: true
  validates :alg, presence: true
  validates :inf, presence: true
end
