
class ObjectivesController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :get_quest

  def new
    @quest = Quest.find(params[:quest_id])
    @objective = @quest.objectives.new

    respond_to do |wants|
      wants.html # new.html.erb
      wants.xml  { render :xml => @objective }
    end
  end

  def create
    @quest = Quest.find(params[:quest_id])
    @objective = @quest.objectives.new(params[:objective])
  
    respond_to do |wants|
      if @objective.save
        flash[:notice] = 'Objective was successfully created.'
        wants.html { redirect_to(@quest) }
        wants.xml  { render :xml => @objective, :status => :created, :location => @objective }
      else
        wants.html { render :action => "new" }
        wants.xml  { render :xml => @objective.errors, :status => :unprocessable_entity }
      end
    end
  end
  private

  def get_quest
    @quest = Quest.find(params[:quest_id]) if params[:quest_id].present?
  end
end
