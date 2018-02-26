
library(dplyr)

players_info <- read.csv("player.csv", sep =",")

overallRatings_Players <- select(players_info, player_name, overall_rating)
top10Players <- head(arrange(overallRatings_Players, desc(overall_rating)), 10)
top10Players

gkAttribute_Players <- select(players_info, player_name, sum_gk)
top10GoalKeepers <- head(arrange(gkAttribute_Players, desc(sum_gk)), 10)
top10GoalKeepers

top10Players_presences <- select(players_info, player_name, Number_of_appearances)
top10Players_presences <- head(arrange(top10Players_presences, desc(Number_of_appearances)), 10)
top10Players_presences

overall_league_data <- select(players_info, player_name, leagues_played)
top10Players_leaguesPlayed <- head(arrange(overall_league_data, desc(leagues_played)), 10)
top10Players_leaguesPlayed

teams_info <- read.csv("team.csv", sep =",")

buildUpPlay_teams <- select(teams_info, team_api_id, team_long_name, buildUpPlay)
buildUpPlay_top10teams <- head(arrange(buildUpPlay_teams, desc(buildUpPlay)), 10)
buildUpPlay_top10teams

chanceCreation_teams <- select(teams_info, team_api_id, team_long_name, chanceCreation)
chanceCreation_top10teams <- head(arrange(chanceCreation_teams, desc(chanceCreation)), 10)
chanceCreation_top10teams

defense_teams <- select(teams_info, team_api_id, team_long_name, defense)
defense_top10teams <- head(arrange(defense_teams, desc(defense)), 10)
defense_top10teams

fielded_players_team_data <- select(teams_info, team_long_name, fielded_Players)
top10TeamsByFieldedPlayers <- head(arrange(fielded_players_team_data, desc(fielded_Players)), 10)
top10TeamsByFieldedPlayers

topTeamByFieldedPlayers <- head(top10TeamsByFieldedPlayers, 1)
topTeamByFieldedPlayers

team_goals_data <- select(teams_info, team_long_name, total_goals)
team_info_goals <- arrange(team_goals_data, desc(total_goals))
top10TeamsByGoals <- head(team_info_goals, 10)
top10TeamsByGoals
