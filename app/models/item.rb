class Item < ActiveRecord::Base
  validates :name, :presence => true
  validate :action_date_cannot_be_in_the_past

  def action_date_cannot_be_in_the_past
    if action_date.present? && action_date < Date.today
      errors.add(:action_date, "can't be in the past")
    end
  end
  belongs_to :user
end
