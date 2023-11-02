require 'item'

describe Item do
  it 'creates object' do
    item = Item.new('foo', 0, 0)

    expect(item.name).to eq 'foo'
    expect(item.sell_in).to eq 0
    expect(item.quality).to eq 0
  end

  it '#to_s' do
    item = Item.new('Example Item', 5, 10)

    expect(item.to_s).to eq('Example Item, 5, 10')
  end
end
