require './lib/item'

class LegendaryItem < Item
  def initialize(name, _sell_in, quality)
    super(name, nil, quality)
  end

  def update; end
end
