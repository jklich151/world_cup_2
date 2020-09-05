class Team
  attr_reader :country, :players
  attr_accessor :eliminated

  def initialize(country)
    @country = country
    @eliminated = false
    @players = []
  end

  def eliminated?
    @eliminated
  end

  def add_player(player)
    @players << player
  end

  def players_by_position(position)
    position_player = []
    @players.each do |player|
      if player.position == position
        position_player << player
      end
    end
    position_player
  end
end
