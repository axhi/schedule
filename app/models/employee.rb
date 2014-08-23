class Employee < ActiveRecord::Base
  attr_accessor :key
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :employee_positions
  has_many :positions, through: :employee_positions
  belongs_to :organization
  has_many :schedules
  has_many :shifts, through: :schedules
  has_many :managers, through: :positions
  before_update :find_organization

private
 def find_organization
  unless key.nil?
    self.organization = Organization.find_by(key_code: key)
  end
 end

end
