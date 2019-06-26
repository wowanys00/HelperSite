class WorksController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :find_work, except:[:index,:new,:create]


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
  def update 
 
  if @work.update(work_params)
    redirect_to work_path(@work.id)
  else
    render 'edit'
  end
  end

  def destroy
  if @work.destroy
  redirect_to works_path
  end
end

  def index
    @works = Work.all
  end

  def show
    @comments=Comment.where(work_id: @work.id).order(created_at: :desc)
  end

  private

  def work_params
    params.require(:work).permit(:user_id,:title,:body,photos:[])
  end
  def find_work
    @work = Work.find(params[:id])
  end
end
