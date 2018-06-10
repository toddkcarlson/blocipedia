class DowngradeController < ApplicationController
    def new
    end
    
    def create        	
        current_user.update_attribute(:standard, true)
        current_user.update_attribute(:premium, false)

        current_user.wikis.each do |pub|
        	pub.update_attribute(:private, false)
        end
        
        flash[:notice] = "You have successfully downgraded your account. Your private wikis are now public wikis."
        
        redirect_to root_path
    end
end
