class QuestsController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :get_quest

  def index
    @quests = Quest.all
    respond_to do |wants|
      wants.html # index.html.erb
      wants.xml  { render :xml => @quests }
    end
  end

  def new
    @quest = current_user.quests.new
  end

  def create
    @quest = current_user.quests.new(params[:quest])
    if @quest.save
      redirect_to root_url, :notice => "New Quest Added"
    else
      render "new"
    end
  end

  def edit
    @quest = Quest.find(params[:id])
  end

  def embark
    @quest.add_to_user(current_user)
    redirect_to root_url
  end

  private

  def get_quest
    @quest = Quest.find(params[:id]) if params[:id].present?
  end


end

