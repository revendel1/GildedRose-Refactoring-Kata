require './lib/items/common_item'

class AgedBrieItem < CommonItem
  private

  def update_quality
    @quality += 1 if @quality < 50
  end
end
