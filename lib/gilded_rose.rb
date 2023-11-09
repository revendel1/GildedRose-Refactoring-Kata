class GildedRose
  attr_reader :items

  def initialize(items)
    # для каждого товара храним его оригинальный объект и распарсенный для него тип

    @items = items.map { |item| { item:, type: TypesParser.fetch_type(item.name) } }
  end

  def add_item(item)
    @items << { item:, type: TypesParser.fetch_type(item.name) }
  end

  def update_quality
    # используем класс-потомок для того, чтобы изменить значения атрибутов в соответствии с заданными правилами
    # и поменяем затем значения оригинального объекта класса Item на полученные новые

    @items.each do |item_data|
      item = item_data[:item]

      descendant = item_data[:type].new(item.name, item.sell_in, item.quality)
      descendant.next_day

      item.sell_in = descendant.sell_in
      item.quality = descendant.quality
    end
  end
end
