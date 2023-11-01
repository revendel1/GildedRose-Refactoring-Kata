class GildedRose
  attr_reader :items

  def initialize(items)
    @items = TypesParser.parse_items(items)
  end

  def update_quality
    @items.each(&:update)
  end
end
