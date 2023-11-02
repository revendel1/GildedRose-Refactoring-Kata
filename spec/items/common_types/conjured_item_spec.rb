require 'items/common_types/conjured_item'

describe ConjuredItem do
  it 'creates object' do
    item = ConjuredItem.new('foo', 0, 0)

    expect(item.name).to eq 'foo'
    expect(item.sell_in).to eq 0
    expect(item.quality).to eq 0
  end

  it '#update_quality' do
    item = ConjuredItem.new('Example', 5, 10)
    item.send(:update_quality)

    expect(item.sell_in).to eq 5
    expect(item.quality).to eq 8
  end

  it '#update_quality when sell_in negative' do
    item = ConjuredItem.new('Example', -5, 10)
    item.send(:update_quality)

    expect(item.sell_in).to eq(-5)
    expect(item.quality).to eq 6
  end
end
