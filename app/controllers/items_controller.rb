class ItemsController < ApplicationController
  def create
    @checklist = Checklist.find(params[:checklist_id])
    @item = @checklist.items.create(item_params)
    redirect_to checklist_path(@checklist)
  end

  def destroy
    @checklist = Checklist.find(params[:checklist_id])
    @item = @checklist.items.find(params[:id])

    raise Exceptions::SecurityTransgression unless current_user.can_delete?(@item)

    @item.destroy
    redirect_to checklist_path(@checklist)
  end

  def item_params
    params.require(:item).permit(:text)
  end
end
