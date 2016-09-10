class ChecklistsController < ApplicationController
  def create
    @checklist = Checklist.new(checklist_params)
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
    @checklist.update(params[:checklist].permit(:title, :text))

    if @checklist.save
      redirect_to @checklist
    else
      render 'edit'
    end
  end

  def destroy
    @checklist = Checklist.find(params[:id])
    @checklist.destroy
    redirect_to checklists_path
  end

  private

  def checklist_params
    params.require(:checklist).permit(:title, :text)
  end
end
