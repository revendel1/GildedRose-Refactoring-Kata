# frozen_string_literal: true

require 'item'
require 'gilded_rose'
require 'types_parser'

describe GildedRose do
  it 'create CommonItem object' do
    items = [Item.new('foo', 0, 0)]
    parsed_item = GildedRose.new(items).items[0]

    expect(parsed_item.class).to eq CommonItem
    expect(parsed_item.name).to eq 'foo'
    expect(parsed_item.sell_in).to eq 0
    expect(parsed_item.quality).to eq 0
  end

  it '#update_quality' do
    items = [
      Item.new(name = '+5 Dexterity Vest', sell_in = 10, quality = 20),
      Item.new(name = 'Aged Brie', sell_in = 2, quality = 0),
      Item.new(name = 'Elixir of the Mongoose', sell_in = 5, quality = 7),
      Item.new(name = 'Sulfuras, Hand of Ragnaros', sell_in = 0, quality = 80),
      Item.new(name = 'Sulfuras, Hand of Ragnaros', sell_in = -1, quality = 80),
      Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 15, quality = 20),
      Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 10, quality = 49),
      Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 5, quality = 49),
      Item.new(name = 'Conjured Mana Cake', sell_in = 3, quality = 6)
    ]
    parsed_items = GildedRose.new(items).update_quality

    item0 = parsed_items[0]
    expect(item0.class).to eq CommonItem
    expect(item0.name).to eq '+5 Dexterity Vest'
    expect(item0.sell_in).to eq 9
    expect(item0.quality).to eq 19

    item1 = parsed_items[1]
    expect(item1.class).to eq AgedBrieItem
    expect(item1.name).to eq 'Aged Brie'
    expect(item1.sell_in).to eq 1
    expect(item1.quality).to eq 1

    item2 = parsed_items[2]
    expect(item2.class).to eq CommonItem
    expect(item2.name).to eq 'Elixir of the Mongoose'
    expect(item2.sell_in).to eq 4
    expect(item2.quality).to eq 6

    item3 = parsed_items[3]
    expect(item3.class).to eq LegendaryItem
    expect(item3.name).to eq 'Sulfuras, Hand of Ragnaros'
    expect(item3.sell_in).to be_nil
    expect(item3.quality).to eq 80

    item4 = parsed_items[4]
    expect(item4.class).to eq LegendaryItem
    expect(item4.name).to eq 'Sulfuras, Hand of Ragnaros'
    expect(item4.sell_in).to be_nil
    expect(item4.quality).to eq 80

    item5 = parsed_items[5]
    expect(item5.class).to eq BackstagePassesItem
    expect(item5.name).to eq 'Backstage passes to a TAFKAL80ETC concert'
    expect(item5.sell_in).to eq 14
    expect(item5.quality).to eq 21

    item6 = parsed_items[6]
    expect(item6.class).to eq BackstagePassesItem
    expect(item6.name).to eq 'Backstage passes to a TAFKAL80ETC concert'
    expect(item6.sell_in).to eq 9
    expect(item6.quality).to eq 50

    item7 = parsed_items[7]
    expect(item7.class).to eq BackstagePassesItem
    expect(item7.name).to eq 'Backstage passes to a TAFKAL80ETC concert'
    expect(item7.sell_in).to eq 4
    expect(item7.quality).to eq 50

    item8 = parsed_items[8]
    expect(item8.class).to eq ConjuredItem
    expect(item8.name).to eq 'Conjured Mana Cake'
    expect(item8.sell_in).to eq 2
    expect(item8.quality).to eq 4
  end
end
