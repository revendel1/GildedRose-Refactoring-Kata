require 'types_parser'
require 'item'
require 'items/common_item'
require 'items/legendary_item'
require 'items/common_types/aged_brie_item'
require 'items/common_types/backstage_passes_item'
require 'items/common_types/conjured_item'

describe TypesParser do
  context '#fetch_type' do
    it 'common item' do
      klass = TypesParser.send(:fetch_type, '+5 Dexterity Vest')

      expect(klass).to eq CommonItem
    end

    it 'aged brie item' do
      klass = TypesParser.send(:fetch_type, 'Aged Brie')

      expect(klass).to eq AgedBrieItem
    end

    it 'backstage passes item' do
      klass = TypesParser.send(:fetch_type, 'Backstage passes to a TAFKAL80ETC concert')

      expect(klass).to eq BackstagePassesItem
    end

    it 'conjured item' do
      klass = TypesParser.send(:fetch_type, 'Conjured Mana Cake')

      expect(klass).to eq ConjuredItem
    end

    it 'legendary item' do
      klass = TypesParser.send(:fetch_type, 'Sulfuras, Hand of Ragnaros')

      expect(klass).to eq LegendaryItem
    end
  end

  it '#parse_items' do
    items = [
      Item.new(name = 'Aged Brie', sell_in = 2, quality = 0),
      Item.new(name = 'Elixir of the Mongoose', sell_in = 5, quality = 7),
      Item.new(name = 'Sulfuras, Hand of Ragnaros', sell_in = 0, quality = 80)
    ]
    parsed_items = TypesParser.parse_items(items)
    
    item0 = parsed_items[0]
    expect(item0.class).to eq AgedBrieItem
    expect(item0.name).to eq 'Aged Brie'
    expect(item0.sell_in).to eq 2
    expect(item0.quality).to eq 0

    item1 = parsed_items[1]
    expect(item1.class).to eq CommonItem
    expect(item1.name).to eq 'Elixir of the Mongoose'
    expect(item1.sell_in).to eq 5
    expect(item1.quality).to eq 7

    item2 = parsed_items[2]
    expect(item2.class).to eq LegendaryItem
    expect(item2.name).to eq 'Sulfuras, Hand of Ragnaros'
    expect(item2.sell_in).to eq nil
    expect(item2.quality).to eq 80
  end
end
