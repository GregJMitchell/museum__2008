class Exhibit
  attr_reader :name, :cost
  def initialize(data_hash)
    @name = data_hash[:name]
    @cost = data_hash[:cost]
  end
end