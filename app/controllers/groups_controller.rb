class GroupsController < ApplicationController
  include GroupsHelper
  before_action :set_group, only: %i[show edit update destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /groups or /groups.json
  def index
    @groups = current_user.groups
    @total = total_expenses(current_user)
    @title = 'Categories'
  end

  # GET /groups/1 or /groups/1.json
  def show
    @group = Group.find(params[:id])
    @deals = @group.deals.order(created_at: :desc)
    @title = @group.name
    @previous_path = groups_path
  end

  # GET /groups/new
  def new
    @group = Group.new
    @title = 'New Category'
    @previous_path = groups_path
  end

  # POST /groups or /groups.json
  def create
    @group = current_user.groups.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to group_url(@group), notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
