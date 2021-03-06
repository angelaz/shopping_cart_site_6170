class UsersController < ApplicationController
    def new
      @user = User.new
    end

    def create
      @user = User.new(params[:user])
      @user.usertype = params[:usertype]
      if @user.save
        session[:user_id] = @user.id

        if !@user.is_seller
          cart = current_cart
          cart.user = @user
          cart.save
        end

        redirect_to root_url, :notice => "Signed up!"
      else
        render :new
      end
    end

    def new_cart

    end
end
