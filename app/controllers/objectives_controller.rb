
class ObjectivesController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]

  def new
    @quest = Quest.find(params[:quest_id])
    @exp = @quest.remaining_exp - (3 - @quest.objectives.size if @quest.objectives.size < 4)
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
end
