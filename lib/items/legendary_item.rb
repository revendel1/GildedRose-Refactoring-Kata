require './lib/item'

class LegendaryItem < Item
  def initialize(name, _sell_in, quality)
    # по условию легендарные товары не имеют срока годности
    super(name, nil, quality)
  end

  def next_day; end

  def to_s
    "#{@name}, null, #{@quality}"
  end
end
