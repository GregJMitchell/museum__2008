class Museum
  attr_reader :name, :exhibits
  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    recommenations = []
    patron.interests.each do |interest|
      @exhibits.each do |exhibit|
        if exhibit.name == interest
          recommenations << exhibit
        end
      end
    end
    recommenations
  end
end