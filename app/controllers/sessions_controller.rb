class SessionsController < ApplicationController
    
   def new
   
   end
   
   def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success]= "You Have successfully signed in"
            redirect_to user_path(user)
        else
            flash.now[:danger]="there was something wrong with you login info"
            redirect_to root_path
        end
   end
   
   def destroy
        session[:user_id] = nil
        #flash[:success] = "You have logged out"
        redirect_to root_path
   end
    
end