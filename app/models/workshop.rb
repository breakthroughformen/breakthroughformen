# == Schema Information
#
# Table name: workshops
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  name        :string(255)
#  active      :boolean          default(FALSE)
#

class Workshop < ActiveRecord::Base
  has_many :meetings, -> { order("position ASC") }, dependent: :destroy

  #has_many :workshop_enrollments, dependent: :destroy
  #has_many :enrollments, through: :workshop_enrollments, source: :user

  has_paper_trail

  validates :name, presence: true
  validates :title, presence: true

  scope :bt1_or_bt2, -> { where(name: ["BT1", "BT2"]) }
  scope :active, -> { where(active: true) }
  scope :upcoming, -> { joins(:meetings).merge(Meeting.upcoming) }
  scope :past, -> { joins(:meetings).merge(Meeting.past) }
end

# self.created_on.strftime("%B %d, %Y")
