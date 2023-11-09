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
end
