class Player < ActiveRecord::Base
  belongs_to :team

  def player_info #2 queries
      players = Player.all
      players.each do |player|
          team = player.team
          puts "Team: #{team.name} ~~ Mascot: #{team.mascot} ~~ Stadium: #{team.stadium}"
      end
  end

  def player_includes
      players = Player.includes(:team)
      players.each do |player|
          puts "Team: #{player.team.name} ~~ Mascot : #{player.team.mascot} ~~ Stadium: #{player.team.stadium}"
  end

  def chicago_bulls
      Player.includes(:team).where("teams.name = 'Chicago Bulls'").references(:team)
  end

  def staples_ctr
      Player.includes(:team).where("teams.stadium = 'Staples Center'").references(:team)
      # OR ...
      # Player.joins(:team).select('players.*', 'teams.name as franchise', 'teams.stadium as stadium').where("teams.stadium = 'Staples Center'")
  end

  def z_player
      Team.includes(:players).where("players.name LIKE 'z%'").references(:players)
      # OR ...
      Team.joins(:players).where("players.name LIKE 'z%'")

      # .joins can fetch more information:
      # Team.joins(:players).where("players.name LIKE 'z%'").select("teams.name as team_name", "teams.*", "players.*")
      # this is NOT case sensitive!
  end

end
