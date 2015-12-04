class CapturedImage < ActiveRecord::Base
  enum status: { main: 0, sub: 1 }
  
  belongs_to :prototype
end
