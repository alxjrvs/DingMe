class QuestsController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]

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

  def edit
    @quest = Quest.find(params[:id])
  end
  end
end
