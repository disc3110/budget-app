class DealsController < ApplicationController
  before_action :set_deal, only: %i[show edit update destroy]
  before_action :set_group, only: %i[new edit create index]
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /deals/new
  def new
    @category = params[:category]
    @deal = Deal.new
    @title = 'Transaction'
    @previous_path = group_path(@group)
  end

  # POST /deals or /deals.json
  def create
    p @group
    @deal = @group.deals.create(deal_params)

    respond_to do |format|
      if @deal.save
        format.html { redirect_to group_path(@group), notice: 'Deal was successfully created.' }
        format.json { render :show, status: :created, location: @deal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_deal
    @deal = Deal.find(params[:id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def deal_params
    params.require(:deal).permit(:name, :amount).merge(user_id: current_user.id)
  end
end
