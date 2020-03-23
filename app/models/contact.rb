class Contact < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :contact_groups
  has_many :groups, through: :contact_groups
 

  def friendly_updated_at
    updated_at.strftime("%m/%d/%Y")
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end
end