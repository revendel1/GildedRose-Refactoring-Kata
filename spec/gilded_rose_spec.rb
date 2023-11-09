# frozen_string_literal: true

require 'item'
require 'gilded_rose'
require 'types_parser'

describe GildedRose do
  it 'create CommonItem object' do
    items = [Item.new('foo', 0, 0)]
    parsed_item = GildedRose.new(items).items[0]

    expect(parsed_item[:type]).to eq CommonItem
    expect(parsed_item[:item].name).to eq 'foo'
    expect(parsed_item[:item].sell_in).to eq 0
    expect(parsed_item[:item].quality).to eq 0
  end

  it '#add_item' do
    items = [Item.new('foo', 0, 0)]
    gilded_rose = GildedRose.new(items)
    gilded_rose.add_item Item.new('Aged Brie', 2, 0)

    expect(gilded_rose.items.size).to eq 2
    expect(gilded_rose.items[1][:type]).to eq AgedBrieItem
    expect(gilded_rose.items[1][:item].name).to eq 'Aged Brie'
  end

  it '#update_quality' do
    items = [
      Item.new('+5 Dexterity Vest', 10, 20),
      Item.new('Aged Brie', 2, 0),
      Item.new('Elixir of the Mongoose', 5, 7),
      Item.new('Sulfuras, Hand of Ragnaros', 0, 80),
      Item.new('Sulfuras, Hand of Ragnaros', -1, 80),
      Item.new('Backstage passes to a TAFKAL80ETC concert', 15, 20),
      Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 49),
      Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 49),
      Item.new('Conjured Mana Cake', 3, 6)
    ]
    gr_items = GildedRose.new(items).update_quality

    expect(gr_items[0][:type]).to eq CommonItem
    expect(items[0].sell_in).to eq 9
    expect(items[0].quality).to eq 19

    expect(gr_items[1][:type]).to eq AgedBrieItem
    expect(items[1].sell_in).to eq 1
    expect(items[1].quality).to eq 1

    expect(gr_items[2][:type]).to eq CommonItem
    expect(items[2].sell_in).to eq 4
    expect(items[2].quality).to eq 6

    expect(gr_items[3][:type]).to eq LegendaryItem
    expect(items[3].sell_in).to be_nil
    expect(items[3].quality).to eq 80

    expect(gr_items[4][:type]).to eq LegendaryItem
    expect(items[4].sell_in).to be_nil
    expect(items[4].quality).to eq 80

    expect(gr_items[5][:type]).to eq BackstagePassesItem
    expect(items[5].sell_in).to eq 14
    expect(items[5].quality).to eq 21

    expect(gr_items[6][:type]).to eq BackstagePassesItem
    expect(items[6].sell_in).to eq 9
    expect(items[6].quality).to eq 50

    expect(gr_items[7][:type]).to eq BackstagePassesItem
    expect(items[7].sell_in).to eq 4
    expect(items[7].quality).to eq 50

    expect(gr_items[8][:type]).to eq ConjuredItem
    expect(items[8].sell_in).to eq 2
    expect(items[8].quality).to eq 4
  end
end
