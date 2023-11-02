require './lib/item'

class CommonItem < Item
  def initialize(name, sell_in, quality)
    raise ArgumentError, 'Quality must be in range 0-50' unless (0..50).cover? quality

    super(name, sell_in, quality)
  end

  def next_day
    update_sell_in
    update_quality
  end

  private

  def update_sell_in
    @sell_in -= 1
  end

  protected

  def update_quality(dec = 1)
    @quality -= (@sell_in.positive? ? dec : dec * 2)
    @quality = 0 if @quality.negative?
  end
end
