class User < ActiveRecord::Base
 
  validates :name, presence: true, uniqueness: true  #it validates the usr name should be not blank and it should be unique and fld shld must 
  
  has_secure_password      # it means password is secure no one can see this is happen bcz we define it as digest


  after_destroy :ensure_an_admin_remains
      private
	   def ensure_an_admin_remains
		if User.count.zero?
			raise "Can't delete last user"
	        end
	    end

end
