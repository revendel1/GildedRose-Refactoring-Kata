require 'items/common_types/aged_brie_item'

describe AgedBrieItem do
  it 'creates object' do
    item = AgedBrieItem.new('foo', 0, 0)

    expect(item.name).to eq 'foo'
    expect(item.sell_in).to eq 0
    expect(item.quality).to eq 0
  end

  it '#update_quality' do
    item = AgedBrieItem.new('Example', 5, 10)
    item.send(:update_quality)

    expect(item.sell_in).to eq 5
    expect(item.quality).to eq 11
  end

  it '#update' do
    item = AgedBrieItem.new('Example', 5, 10)
    item.update

    expect(item.sell_in).to eq 4
    expect(item.quality).to eq 11
  end

  it 'quality is 50' do
    item = AgedBrieItem.new('Example', 5, 50)
    item.send(:update_quality)

    expect(item.sell_in).to eq 5
    expect(item.quality).to eq 50
  end
end
