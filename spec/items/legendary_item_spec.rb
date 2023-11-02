require 'items/legendary_item'

describe LegendaryItem do
  it 'creates object' do
    item = LegendaryItem.new('Example', 2, 2)

    expect(item.name).to eq 'Example'
    expect(item.sell_in).to be_nil
    expect(item.quality).to eq 2
  end

  it '#next_day do nothing' do
    item = LegendaryItem.new('Example', nil, 2)
    item.next_day

    expect(item.name).to eq 'Example'
    expect(item.sell_in).to be_nil
    expect(item.quality).to eq 2
  end

  it '#to_s' do
    item = LegendaryItem.new('Example', 5, 10)

    expect(item.to_s).to eq('Example, null, 10')
  end
end
