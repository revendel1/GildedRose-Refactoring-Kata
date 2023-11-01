require 'items/common_types/conjured_item'

describe ConjuredItem do
  it 'creates object' do
    item = ConjuredItem.new('foo', 0, 0)

    expect(item.name).to eq 'foo'
    expect(item.sell_in).to eq 0
    expect(item.quality).to eq 0
  end

  it '#update' do
    item = ConjuredItem.new('Example', 5, 10)
    item.update

    expect(item.sell_in).to eq 4
    expect(item.quality).to eq 8
  end

  it '#update when sell_in negative' do
    item = ConjuredItem.new('Example', -5, 10)
    item.update

    expect(item.sell_in).to eq(-6)
    expect(item.quality).to eq 6
  end
end
