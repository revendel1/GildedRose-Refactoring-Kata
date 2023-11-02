require './lib/items/common_item'

class ConjuredItem < CommonItem
  private

  def update_quality
    super 2
  end
end
