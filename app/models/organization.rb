class Organization < ActiveRecord::Base
  has_many :employees
  has_many :shifts
  has_many :employee_positions
  has_many :positions, through: :employee_positions
  before_save :create_key

  def managers
    self.positions.where(name: "Manager")
  end
private

  def create_key
    self.key_code = SecureRandom.hex(4)
  end

end
