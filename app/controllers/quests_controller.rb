class QuestsController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :get_quest

  def index
    @quests = Quest.all_published
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
      redirect_to new_quest_objective_path(@quest), :notice => "New Quest Added"
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
    if @quest.valid_publish
      @quest.save
    else
      flash[:notice] = "Must have at least 4 Objectives!"
      redirect_to back_url
    end
  end

  private

  def get_quest
    @quest = Quest.find(params[:id]) if params[:id].present?
  end


end

