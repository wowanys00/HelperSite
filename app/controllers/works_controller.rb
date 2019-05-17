class WorksController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]

  def new
    @work = Work.new 
  end
  def create
    @work = current_user.works.build(work_params)
    if @work.save
      redirect_to work_path(@work.id)
    else 
      render 'new'
    end
  end

  def edit
  end

  def index
  end

  def show
    @work = Work.find(params[:id])
  end
  private

  def work_params
    params.require(:work).permit(:user_id,:title,:body,photos:[])
  end

end
