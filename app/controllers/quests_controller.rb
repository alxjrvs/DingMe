class QuestsController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]

  def new
    @quest = current_user.quests.new
  end
end
