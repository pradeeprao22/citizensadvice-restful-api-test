class GroupsController < ApplicationController
    # before_action :authorize_request

    def index
        @groups = Group.all
    end

    def create
        @user = User.find_by(id: group_params[:user_id])
        @user = @user.reload
        if @user.admin?
            @group = Group.new(group_name: group_params[:group_name])
            if @group.save!
                render json: @group
            else 
                render json: @group.errors, status: :unprocessable_entity
            end
        else
            render json: "This user do not have permission"
        end
    end

    def allocate_group
        @user = User.find_by(token: group_params[:current_user_token])
        if @user.admin?
           @user_group = UsersGroup.new(group_id: group_params[:group_id], user_id: group_params[:user_id])
           if @user_group.save!
             render json: {
                user_group: @user_group, 
                message: "user is assigned to group"
            }, status: :created
           else 
             render json: @user_group.errors, status: :unprocessable_entity
           end
        else
            render json: "This user do not have permission"   
        end
    end

    private
    
    def group_params
        params.permit(:group_name, :group_id, :user_id, :current_user_token)
    end
end