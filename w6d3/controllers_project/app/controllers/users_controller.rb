class UsersController < ApplicationController
    def index
       render json: User.all
    end

    def create
        user = User.new(our_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end
    
    def show
        user = User.find(params[:id])
        render json: user
    end

    def update
        user = User.find(params[:id])
        user.update(our_params)
        render json: user
    end

    def destroy
        user = User.find(params[:id])
        user.delete
        render json: user
    end

    private 
        
    def our_params
        params.require(:banana).permit(:username)
    end
end

# {banana: 
#     {
#         username: c
#         d: e    
#     }

# }