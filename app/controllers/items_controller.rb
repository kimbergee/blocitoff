class ItemsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @item = @user.items.new(item_params)
    @item.user = current_user

    if @item.save
      flash[:notice] = "Item was saved."
    else
      flash[:error] = "There was an error saving your item. Please try again."
    end
    redirect_to users_show_path
  end

  def destroy
    @item = Item.find(params[:id])
    @user = User.find(params[:user_id])

    if @item.destroy
      flash[:notice] = "Item was completed and removed."
    else
      flash[:error] = "There was an error removing the item."
    end
    redirect_to users_show_path
    # respond_to do |format|
    #   format.html { redirect_to users_show_path}
    #   format.js
    # end

  end


  private
  def item_params
    params.require(:item).permit(:name)
  end

end
