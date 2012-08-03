class QuestsController < ApplicationController

  before_filter :authenticate_user!, except: [:index]
  before_filter :get_quest

  def index
    @quests = Quest.all_published
    respond_to do |wants|
      wants.html # index.html.erb
      wants.xml  { render :xml => @quests }
    end
  end

  def show
    @user = current_user
    @quest = Quest.find(params[:id])

    respond_to do |wants|
      wants.html # show.html.erb
      wants.xml  { render :xml => @quest }
    end
  end

  def new
    @quest = current_user.quests.new
  end

  def create
    @quest = current_user.quests.new(params[:quest])
    if @quest.save
      redirect_to quest_path(@quest), :notice => "New Quest Added"
    else
      render "new"
    end
  end

  def edit
    @quest = Quest.find(params[:id])
  end

  def destroy
    @quest = Quest.find(params[:id])
    @quest.destroy

    respond_to do |wants|
      wants.html { redirect_to(quests_url) }
      wants.xml  { head :ok }
    end
  end

  def embark
    @quest.add_to_user(current_user)
    flash[:notice] = "Successfully copied to your Questlog."
    redirect_to root_url
  end

  def publish
    if @quest.user == current_user
      if @quest.valid_publish
        @quest.save
        flash[:notice] = "Published!"
      else
        flash[:notice] = "Must have at least 4 Objectives that add up to 100!!"
        redirect_to quest_path(@quest)
      end
    else
      redirect_to quest_path(@quest)
    end
  end

  private

  def get_quest
    @quest = Quest.find(params[:id]) if params[:id].present?
  end


end

