class TusersController < ApplicationController
	
	 def show
      @users = User.all
      respond_to do |format|
          format.html # show.html.erb
          format.xml  { render :xml => @user }
      end
    end
end
