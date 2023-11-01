require 'items/common_item'

describe CommonItem do
  it 'unsuccessful' do
    expect { CommonItem.new('foo', 0, 60) }.to raise_error ArgumentError, 'Quality must be in range 0-50'
  end

  it 'creates object' do
    item = CommonItem.new('foo', 0, 0)

    expect(item.name).to eq 'foo'
    expect(item.sell_in).to eq 0
    expect(item.quality).to eq 0
  end

  context 'methods' do
    it '#update' do
      item = CommonItem.new('Example', 5, 10)
      item.update

      expect(item.name).to eq 'Example'
      expect(item.sell_in).to eq 4
      expect(item.quality).to eq 9
    end

    it '#update_sell_in' do
      item = CommonItem.new('Common', 5, 10)
      item.send(:update_sell_in)

      expect(item.sell_in).to eq 4
      expect(item.quality).to eq 10
    end

    context '#update_quality' do
      it 'successful' do
        item = CommonItem.new('Example item', 5, 10)
        item.send(:update_quality)

        expect(item.sell_in).to eq 5
        expect(item.quality).to eq 9
      end

      it 'sell_in is negative' do
        item = CommonItem.new('Example item', -5, 10)
        item.send(:update_quality)

        expect(item.sell_in).to eq(-5)
        expect(item.quality).to eq 8
      end

      it 'quality becomes negative' do
        item = CommonItem.new('Example item', -5, 1)
        item.send(:update_quality)

        expect(item.sell_in).to eq(-5)
        expect(item.quality).to eq 0
      end

      it 'send with arg' do
        item = CommonItem.new('Example item', 5, 10)
        item.send(:update_quality, 3)

        expect(item.sell_in).to eq 5
        expect(item.quality).to eq 7
      end
    end
  end
end
