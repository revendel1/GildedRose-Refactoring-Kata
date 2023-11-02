require 'items/common_types/backstage_passes_item'

describe BackstagePassesItem do
  it 'creates object' do
    item = BackstagePassesItem.new('foo', 0, 0)

    expect(item.name).to eq 'foo'
    expect(item.sell_in).to eq 0
    expect(item.quality).to eq 0
  end

  it '#next_day' do
    item = BackstagePassesItem.new('Example', 5, 10)
    item.next_day

    expect(item.name).to eq 'Example'
    expect(item.sell_in).to eq 4
    expect(item.quality).to eq 13
  end

  context '#update_quality' do
    it 'sell_in more than 10' do
      item = BackstagePassesItem.new('Example', 11, 10)
      item.send(:update_quality)

      expect(item.sell_in).to eq 11
      expect(item.quality).to eq 11
    end

    it 'sell_in less than 10' do
      item = BackstagePassesItem.new('Example', 9, 10)
      item.send(:update_quality)

      expect(item.sell_in).to eq 9
      expect(item.quality).to eq 12
    end

    it 'sell_in less than 5' do
      item = BackstagePassesItem.new('Example', 4, 10)
      item.send(:update_quality)

      expect(item.sell_in).to eq 4
      expect(item.quality).to eq 13
    end

    it 'sell_in is negative' do
      item = BackstagePassesItem.new('Example', -1, 49)
      item.send(:update_quality)

      expect(item.sell_in).to eq(-1)
      expect(item.quality).to eq 0
    end

    it 'quality more than 50' do
      item = BackstagePassesItem.new('Example', 4, 49)
      item.send(:update_quality)

      expect(item.sell_in).to eq 4
      expect(item.quality).to eq 50
    end
  end
end
