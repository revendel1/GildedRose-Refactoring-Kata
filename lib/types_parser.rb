# frozen_string_literal: true

require './lib/items/common_item'
require './lib/items/legendary_item'
require './lib/items/common_types/aged_brie_item'
require './lib/items/common_types/backstage_passes_item'
require './lib/items/common_types/conjured_item'

module TypesParser
  TYPES = {
    'Aged Brie' => AgedBrieItem,
    'Backstage passes' => BackstagePassesItem,
    'Conjured' => ConjuredItem,
    'Sulfuras' => LegendaryItem
  }.freeze

  def self.fetch_type(name)
    TYPES.each_pair do |type, klass|
      return klass if name.start_with?(type)
    end

    CommonItem
  end
end
