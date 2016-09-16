class ChecklistsController < ApplicationController
  before_filter :require_sign_in!, except: [:index, :show]

  def my_checklists
    @checklists = current_user.checklists
    flash.now[:my_checklists] = true
    render :index
  end

  def add_checklist
    @checklist = Checklist.find(params[:id])
    current_user.checklists << @checklist
    redirect_to @checklist
  end

  def create
    @checklist = Checklist.new(checklist_params)
    @checklist.author = current_user
    if @checklist.save
      redirect_to @checklist
    else
      render 'new'
    end
  end

  def new
    @checklist = Checklist.new
  end

  def show
    @checklist = Checklist.find(params[:id])
  end

  def index
    @checklists = Checklist.all
  end

  def edit
    @checklist = Checklist.find(params[:id])
  end

  def update
    @checklist = Checklist.find(params[:id])

    raise Exceptions::SecurityTransgression unless current_user.can_edit?(@checklist)

    @checklist.update(params[:checklist].permit(:title, :text))

    if @checklist.save
      redirect_to @checklist
    else
      render 'edit'
    end
  end

  def destroy
    @checklist = Checklist.find(params[:id])

    raise Exceptions::SecurityTransgression unless current_user.can_delete?(@checklist)

    @checklist.destroy
    redirect_to checklists_path
  end

  private

  def checklist_params
    params.require(:checklist).permit(:title, :text)
  end
end
