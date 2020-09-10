class Museum
  attr_reader :name, :exhibits, :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    recommenations = []
    patron.interests.each do |interest|
      @exhibits.each do |exhibit|
        recommenations << exhibit if exhibit.name == interest
      end
    end
    recommenations
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    patrons_per_exhibit = {}
    @exhibits.each do |exhibit|
      patrons_per_exhibit_array = []
      @patrons.each do |patron|
        patrons_per_exhibit_array << patron if patron.interests.include? exhibit.name
      end
      patrons_per_exhibit[exhibit] = patrons_per_exhibit_array
    end
    patrons_per_exhibit
  end

  def ticket_lottery_contestants(exhibit)
    patrons = patrons_by_exhibit_interest[exhibit]
    patrons.find_all do |patron|
      patron.spending_money < exhibit.cost 
    end
  end

  def draw_lottery_winner(exhibit)
    ticket_lottery_contestants(exhibit).sample
  end

  def announce_lottery_winner(exhibit)
    return 'No winners for this lottery' if draw_lottery_winner(exhibit).nil?

    "#{draw_lottery_winner(exhibit).name} has won the #{exhibit.name} lottery"
  end
end
