require './lib/items/common_item'

class BackstagePassesItem < CommonItem
  private

  def update_quality
    return @quality = 0 if @sell_in.negative?

    @quality += case @sell_in
                when (0..5) then 3
                when (6..10) then 2
                else 1
                end
    @quality = 50 if @quality > 50
  end
end
