class Project < ActiveRecord::Base
  has_many :stories
  has_many :iterations

  has_many :statuses
  has_many :difficulties

  accepts_nested_attributes_for :statuses,     allow_destroy: true
  accepts_nested_attributes_for :difficulties, allow_destroy: true
end