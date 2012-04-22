class User < ActiveRecord::Base
  include Clearance::User
  has_many :pieces
  has_many :hyperlinks
end
