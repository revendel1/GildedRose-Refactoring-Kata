require 'items/legendary_item'

describe LegendaryItem do
  it 'creates object' do
    item = LegendaryItem.new('Example', 2, 2)

    expect(item.name).to eq 'Example'
    expect(item.sell_in).to be_nil
    expect(item.quality).to eq 2
  end

  it '#update do nothing' do
    item = LegendaryItem.new('Example', nil, 2)
    item.update

    expect(item.name).to eq 'Example'
    expect(item.sell_in).to be_nil
    expect(item.quality).to eq 2
  end
end
