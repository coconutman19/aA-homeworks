class LRUCache
  def initialize(cache_size)
    @cache_size = cache_size
    @cache = []
  end

  def count
    @cache.count
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
      @cache << el
    elsif count >= @size
      @cache.shift
      @cache << el
    else
      @cache << el
    end
  end

  def show
    @cache
    nil
  end

  private
  # helper methods go here!

end
