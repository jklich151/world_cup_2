require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/team'

class TeamTest < Minitest::Test
  def test_it_exists
    team = Team.new("France")

    assert_instance_of Team, team
  end

  def test_it_has_a_country
    team = Team.new("France")

    assert_equal "France", team.country
  end

  def test_elimination
    team = Team.new("France")

    assert_equal false, team.eliminated?
    team.eliminated = true
    assert_equal true, team.eliminated?
  end

  def test_can_add_players
    team = Team.new("France")

    assert_equal [], team.players

    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    team.add_player(mbappe)
    team.add_player(pogba)
    assert_equal [mbappe, pogba], team.players
  end

  def test_players_by_position
    team = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    team.add_player(mbappe)
    team.add_player(pogba)

    assert_equal [pogba], team.players_by_position("midfielder")
    assert_equal [], team.players_by_position("defender")
  end
end
