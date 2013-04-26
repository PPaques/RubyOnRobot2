class Robot < ActiveRecord::Base
  attr_accessible :name, :fpga_adress, :actif

  has_many :registers,          :inverse_of => :robot, :dependent => :delete_all
  has_many :gpios,              :inverse_of => :robot, :dependent => :delete_all
  has_many :statuses,           :inverse_of => :robot, :dependent => :delete_all
  has_many :tasks,              :inverse_of => :robot, :dependent => :delete_all
  has_many :operations,         :inverse_of => :robot, :dependent => :delete_all
  has_many :operation_generics, :inverse_of => :robot, :dependent => :delete_all
  has_many :working_operations, :inverse_of => :robot, :dependent => :delete_all
  has_many :perturbations,      :inverse_of => :robot, :dependent => :delete_all

  validates :name,:fpga_adress, :presence => true


  def read_registers
    if Rails.env.production?

    registers.each do |register|
      register.read
    end

    end
  end

  def is_actif?
    actif
  end

  def has_current_operation?
    if current_operation.nil?
      false
    else
      true
    end
  end

  def has_next_operation?
    if next_operation.nil?
      false
    else
      true
    end
  end

  def current_operation
    working_operations.find_by_status("CURRENT")
  end

  def next_operation
    next_operation = working_operations.find_by_status("IDLE")
  end

  def has_perturbation?
    perturbations.each do |perturbation|
      return true if perturbation.is_active?
    end
    return false
  end

  def active_perturbation
    perturbations.each do |perturbation|
      return perturbation if perturbation.is_active?
    end
  end
end