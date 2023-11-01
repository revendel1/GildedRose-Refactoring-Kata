require './lib/items/common_item'

class ConjuredItem < CommonItem
  def update
    update_sell_in
    update_quality 2
  end
end
