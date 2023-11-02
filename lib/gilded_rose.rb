class GildedRose
  attr_reader :items

  def initialize(items)
    # полученные объекты класса Item заменяем на объекты его потомков
    @items = TypesParser.parse_items(items)
  end

  def add_item(item)
    @items += TypesParser.parse_items([item])
  end

  def update_quality
    @items.each(&:next_day)
  end
end
