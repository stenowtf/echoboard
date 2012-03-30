class Project < ActiveRecord::Base
  has_many :stories, :dependent => :destroy
  has_many :iterations, :dependent => :destroy
end
