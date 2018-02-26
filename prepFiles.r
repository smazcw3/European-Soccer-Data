
library(dplyr)
library(RSQLite)
#library(RSQLServer)

#my_db <- src_sqlite("database.sqlite", create = T)

my_db <- dbConnect(SQLite(), dbname="database.sqlite")

country <- as.data.frame(tbl(my_db, sql("SELECT * FROM Country")))

match <- as.data.frame(tbl(my_db, sql("SELECT * FROM Match")))

player <- as.data.frame(tbl(my_db, sql("SELECT * FROM Player")))

team <- as.data.frame(tbl(my_db, sql("SELECT * FROM Team")))

playerAttributes <- as.data.frame(tbl(my_db, sql("SELECT * FROM Player_Attributes")))

teamAttributes <- as.data.frame(tbl(my_db, sql("SELECT * FROM Team_Attributes")))

league <- as.data.frame(tbl(my_db, sql("SELECT * FROM League")))

##1st ques preprocessing
player_df1 <- select(playerAttributes, player_api_id, overall_rating)
player_df1 <- left_join(player_df1, player, by = "player_api_id")
player_df1 <- group_by(player_df1, player_api_id)
player_df1 <- aggregate(overall_rating ~ player_api_id, data = player_df1, max)
player_df1 <- select(left_join(player_df1, player), player_name, overall_rating, player_api_id)

##2nd ques preprocessing
player_df2 <- select(playerAttributes, player_api_id, gk_diving, gk_handling, gk_kicking, gk_positioning, gk_reflexes)
player_df2 <- left_join(player_df2, player, by = "player_api_id")
player_df2 <-  mutate(player_df2, sum_gk = gk_diving + gk_handling + gk_kicking + gk_positioning + gk_reflexes)
player_df2 <-  group_by(player_df2, player_api_id) 
player_df2 <- aggregate(sum_gk ~ player_api_id, data = player_df2, max)
player_df2 <- select(left_join(player_df2, player), player_name, sum_gk, player_api_id)

player_df <- left_join(player_df1, player_df2, by = c("player_api_id","player_name"))

##3rd ques preprocessing
player_df3_select <- select(match, home_player_1:away_player_11)

player_df3_hp1 <- group_by(player_df3_select, home_player_1)
player_df3_hp1 <- summarise(player_df3_hp1, count = n())
colnames(player_df3_hp1) <- c("player_id", "count")

player_df3_hp2 <- group_by(player_df3_select, home_player_2)
player_df3_hp2 <- summarise(player_df3_hp2, count = n())
colnames(player_df3_hp2) <- c("player_id", "count")

player_df3_hp3 <- group_by(player_df3_select, home_player_3)
player_df3_hp3 <- summarise(player_df3_hp3, count = n())
colnames(player_df3_hp3) <- c("player_id", "count")

player_df3_hp4 <- group_by(player_df3_select, home_player_4)
player_df3_hp4 <- summarise(player_df3_hp4, count = n())
colnames(player_df3_hp4) <- c("player_id", "count")

player_df3_hp5 <- group_by(player_df3_select, home_player_5)
player_df3_hp5 <- summarise(player_df3_hp5, count = n())
colnames(player_df3_hp5) <- c("player_id", "count")

player_df3_hp6 <- group_by(player_df3_select, home_player_6)
player_df3_hp6 <- summarise(player_df3_hp6, count = n())
colnames(player_df3_hp6) <- c("player_id", "count")

player_df3_hp7 <- group_by(player_df3_select, home_player_7)
player_df3_hp7 <- summarise(player_df3_hp7, count = n())
colnames(player_df3_hp7) <- c("player_id", "count")

player_df3_hp8 <- group_by(player_df3_select, home_player_8)
player_df3_hp8 <- summarise(player_df3_hp8, count = n())
colnames(player_df3_hp8) <- c("player_id", "count")

player_df3_hp9 <- group_by(player_df3_select, home_player_9)
player_df3_hp9 <- summarise(player_df3_hp9, count = n())
colnames(player_df3_hp9) <- c("player_id", "count")

player_df3_hp10 <- group_by(player_df3_select, home_player_10)
player_df3_hp10 <- summarise(player_df3_hp10, count = n())
colnames(player_df3_hp10) <- c("player_id", "count")

player_df3_hp11 <- group_by(player_df3_select, home_player_11)
player_df3_hp11 <- summarise(player_df3_hp11, count = n())
colnames(player_df3_hp11) <- c("player_id", "count")

player_df_hp <- rbind(player_df3_hp1, player_df3_hp2, player_df3_hp3, player_df3_hp4, player_df3_hp5, player_df3_hp6,
                      player_df3_hp7, player_df3_hp8, player_df3_hp9, player_df3_hp10, player_df3_hp11)



player_df3_ap1 <- group_by(player_df3_select, away_player_1)
player_df3_ap1 <- summarise(player_df3_ap1, count = n())
colnames(player_df3_ap1) <- c("player_id", "count")

player_df3_ap2 <- group_by(player_df3_select, away_player_2)
player_df3_ap2 <- summarise(player_df3_ap2, count = n())
colnames(player_df3_ap2) <- c("player_id", "count")

player_df3_ap3 <- group_by(player_df3_select, away_player_3)
player_df3_ap3 <- summarise(player_df3_ap3, count = n())
colnames(player_df3_ap3) <- c("player_id", "count")

player_df3_ap4 <- group_by(player_df3_select, away_player_4)
player_df3_ap4 <- summarise(player_df3_ap4, count = n())
colnames(player_df3_ap4) <- c("player_id", "count")

player_df3_ap5 <- group_by(player_df3_select, away_player_5)
player_df3_ap5 <- summarise(player_df3_ap5, count = n())
colnames(player_df3_ap5) <- c("player_id", "count")

player_df3_ap6 <- group_by(player_df3_select, away_player_6)
player_df3_ap6 <- summarise(player_df3_ap6, count = n())
colnames(player_df3_ap6) <- c("player_id", "count")

player_df3_ap7 <- group_by(player_df3_select, away_player_7)
player_df3_ap7 <- summarise(player_df3_ap7, count = n())
colnames(player_df3_ap7) <- c("player_id", "count")

player_df3_ap8 <- group_by(player_df3_select, away_player_8)
player_df3_ap8 <- summarise(player_df3_ap8, count = n())
colnames(player_df3_ap8) <- c("player_id", "count")

player_df3_ap9 <- group_by(player_df3_select, away_player_9)
player_df3_ap9 <- summarise(player_df3_ap9, count = n())
colnames(player_df3_ap9) <- c("player_id", "count")

player_df3_ap10 <- group_by(player_df3_select, away_player_10)
player_df3_ap10 <- summarise(player_df3_ap10, count = n())
colnames(player_df3_ap10) <- c("player_id", "count")

player_df3_ap11 <- group_by(player_df3_select, away_player_11)
player_df3_ap11 <- summarise(player_df3_ap11, count = n())
colnames(player_df3_ap11) <- c("player_id", "count")

player_df_ap <- rbind(player_df3_ap1, player_df3_ap2, player_df3_ap3, player_df3_ap4, player_df3_ap5, player_df3_ap6,
                      player_df3_ap7, player_df3_ap8, player_df3_ap9, player_df3_ap10, player_df3_ap11)


player_df3 <- rbind(player_df_hp, player_df_ap)

player_df3 <- group_by(player_df3, player_id)
player_df3 <- summarise(player_df3, count = sum(count))  

colnames(player_df3) <- c("player_api_id", "Number_of_appearances")
player_df3 <- left_join(player_df3, player, by = "player_api_id")

player_df <- left_join(player_df, player_df3, by = c("player_api_id","player_name"))


##4th Ques processing
distinct_leagues <- unique(match$league_id)
overall_league_data <- data_frame()
for(i in distinct_leagues){
    league_data <- subset(match, league_id == i)
    combined_league <- data_frame()
    col_select <- select(league_data, 56:77)
    unique_player_apis <- as.data.frame(unique(unlist(col_select)))
    overall_league_data <- rbind(overall_league_data, unique_player_apis)
}

overall_league_data <- na.omit(overall_league_data)
colnames(overall_league_data) <- "player_id"
overall_league_data <- group_by(overall_league_data, player_id)
overall_league_data <- summarise(overall_league_data, count = n())
colnames(overall_league_data) <- c("player_api_id", "leagues_played") 

player_df <- select(player_df, 1:5)

player_df <- left_join(player_df, overall_league_data, by = "player_api_id")

write.csv(player_df, file="player.csv")


##5th ques, 6th ques, 7th ques preprocessing
refined_teamAttributes <- select(teamAttributes, team_api_id, buildUpPlaySpeed, buildUpPlayDribbling, buildUpPlayPassing
                                 ,chanceCreationPassing, chanceCreationCrossing, chanceCreationShooting, defencePressure, defenceAggression, defenceTeamWidth)

refined_teamAttributes <- mutate(refined_teamAttributes, buildUpPlay = rowSums(cbind(buildUpPlaySpeed, buildUpPlayDribbling, buildUpPlayPassing), na.rm=TRUE),
                                 chanceCreation = rowSums(cbind(chanceCreationPassing, chanceCreationCrossing, chanceCreationShooting), na.rm=TRUE),
                                 defense = rowSums(cbind(defencePressure, defenceAggression,defenceTeamWidth), na.rm=TRUE))

refined_teamAttributes <- group_by(refined_teamAttributes, team_api_id)
refined_teamAttributes <- left_join(refined_teamAttributes, team, by = "team_api_id")
refined_teamAttributes <- group_by(refined_teamAttributes, team_api_id)

refined_teamAttributes_buildUpPlay <- aggregate(buildUpPlay ~ team_api_id, data = refined_teamAttributes, max)
refined_teamAttributes_buildUpPlay <- select(left_join(refined_teamAttributes_buildUpPlay, team), team_long_name, buildUpPlay, team_api_id)
refined_teamAttributes_chanceCreation <- aggregate(chanceCreation ~ team_api_id, data = refined_teamAttributes, max)
refined_teamAttributes_chanceCreation <- select(left_join(refined_teamAttributes_chanceCreation, team), team_long_name, chanceCreation, team_api_id)
refined_teamAttributes_defense <- aggregate(defense ~ team_api_id, data = refined_teamAttributes, max)
refined_teamAttributes_defense <- select(left_join(refined_teamAttributes_defense, team), team_long_name, defense, team_api_id)

team_attribute_param <- inner_join(refined_teamAttributes_buildUpPlay, refined_teamAttributes_chanceCreation, by = c("team_api_id","team_long_name"))

team_attribute_param <- inner_join(team_attribute_param, refined_teamAttributes_defense, by = c("team_api_id","team_long_name"))



##8th, 9th ques preprocessing
team_fielded_players <- select(match, home_team_api_id, away_team_api_id, home_player_1:away_player_11)
home_away_team_apis <- select(team_fielded_players, home_team_api_id, away_team_api_id)

all_team_apis <- as.integer(unique(unlist(home_away_team_apis)))

team_fielded_players_result <- data_frame()
row_count <- 1

for(team_api in all_team_apis){
    home_team_data <- subset(team_fielded_players, home_team_api_id == team_api)
    home_team_players <- select(home_team_data, home_player_1:home_player_11)
    home_team_player_apis <- as.integer(unique(unlist(home_team_players)))
    
    
    away_team_data <- subset(team_fielded_players, away_team_api_id == team_api)
    away_team_players <- select(away_team_data, away_player_1:away_player_11)
    away_team_player_apis <- as.integer(unique(unlist(away_team_players)))
    
    combined_team_players <- c(home_team_player_apis, away_team_player_apis)
    combined_team_players <- unique(combined_team_players)
    length_combined_team_players <- length(combined_team_players)
    team_fielded_players_result[row_count,1] <- team_api
    team_fielded_players_result[row_count,2] <- length_combined_team_players
    row_count <- row_count + 1
}

team_fielded_players_result <- as.data.frame(team_fielded_players_result)
colnames(team_fielded_players_result) <- c("team_api_id", "fielded_Players")

team_attribute_param <- left_join(team_attribute_param, team_fielded_players_result, by = "team_api_id")


##10th ques preprocessing
home_team_goals <- match %>% group_by(team_api_id = home_team_api_id) %>% summarise(home_team_goal = sum(home_team_goal))
away_team_goals <- match %>% group_by(team_api_id = away_team_api_id) %>% summarise(away_team_goal = sum(away_team_goal))
common_team_goals <- full_join(home_team_goals, away_team_goals)
common_team_goals <- mutate(common_team_goals, total_goals = home_team_goal + away_team_goal)

team_info_goals <- left_join(common_team_goals, team, by = c("team_api_id"))
goals_team  <- select(left_join(team_info_goals, team, by = c("team_api_id", "team_long_name")), team_api_id, team_long_name, total_goals)

team_df <- left_join(team_attribute_param, goals_team, by = c("team_api_id", "team_long_name"))

team_df <- select(team_df, team_long_name, team_api_id, buildUpPlay, chanceCreation, defense,
                  fielded_Players, total_goals)


write.csv(team_df, file="team.csv")

