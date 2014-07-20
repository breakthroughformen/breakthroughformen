class SectionEnrollment < ActiveRecord::Base
  enum role: [ :student, :educator, :presenter ]

  belongs_to :user
  belongs_to :section

  scope :students, -> { where(role: roles[:student]) }
  scope :educators, -> { where(role: roles[:educator]) }
  scope :presenters, -> { where(role: roles[:presenter]) }
end