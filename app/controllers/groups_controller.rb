class GroupsController < ApplicationController
  before_action :set_group, except: [:index, :new, :create]

  def index
    @groups = Group.includes(:organizers)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to @group, notice: 'Group created'
    else
      render :new
    end
  end

  def show
    @users = GroupUser.roles.keys.collect { |r| [r, []] }.to_h
    @group.group_users.includes(:user).each do |group_user|
      @users[group_user.role] << group_user.user
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to @group, notice: 'Group updated'
    else
      render :edit
    end
  end

  def destroy
    if @group.destroy
      redirect_to groups_url, notice: 'Group destroyed'
    else
      render :edit
    end
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name)
    end
end
