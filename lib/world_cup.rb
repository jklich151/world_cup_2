class WorldCup
  attr_reader :year, :teams

  def initialize(year, countries)
    @year = year
    @teams = countries
  end

  def active_players_by_position(position)
    players = []
    @teams.each do |team|
      if team.eliminated? == false
        team.players.each do |player|
          if player.position == position
            players << player
          end
        end
      end
    end
    players
  end
end
