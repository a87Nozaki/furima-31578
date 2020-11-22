class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explain, :category_id, :starus_id, :burden_id, :prefecture_id, :day_id, :price).merge(user_id: current_user.id)
  end
end
