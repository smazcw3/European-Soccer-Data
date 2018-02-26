# European-Soccer-Data

Step 1 - Important question were prepared through critical analysis and subsequently required adequate data is cleaned, mungled and converted into a format that is convenient for in-memory operations. This took necessary transformations such as grouping, categorization and binning to stage them for in-memory analysis.

Step 2 -  Relevant answers were obtained from the resultant datasets (in .csv format) obtained from step 1.

Questions that are answered for this dataset are the following:

1. Which are the top 10 players by overall rating?
> top10Players
  | player_name | overall_rating
  | ----------- |  -----------   
1 |      Lionel Messi |  94
2 |  Gianluigi Buffon |  93
3 |      Wayne Rooney |  93
4 | Cristiano Ronaldo |  93
5 |    Xavi Hernandez |  92
6 |    Gregory Coupet |  92
7 |     Thierry Henry |  91
8 |        John Terry |  91
9 |     Iker Casillas |  91
10|  Alessandro Nesta |  91

2. Which are the top 10 goalkeepers by sum of gk attributes?
> top10GoalKeepers
         player_name sum_gk
1   Gianluigi Buffon    449
2     Gregory Coupet    447
3          Petr Cech    445
4      Iker Casillas    442
5       Manuel Neuer    440
6        Julio Cesar    438
7     Sebastian Frey    437
8  Edwin van der Sar    436
9       David De Gea    429
10        Pepe Reina    428

3. Which are the top 10 players by number of appearances (with any team they played with)?
> top10Players_presences
            player_name Number_of_appearances
1        Steve Mandanda                   300
2      Stephane Ruffier                   294
3  Gorka Iraizoz Moreno                   286
4      Samir Handanovic                   286
5           Hugo Lloris                   282
6            Tim Howard                   282
7              Joe Hart                   275
8       Cedric Carrasso                   268
9         Daniel Congre                   262
10       Moussa Sissoko                   260

4. Which are the top 10 players by number of leagues they played in?
> top10Players_leaguesPlayed
             player_name leagues_played
1       Gelson Fernandes              6
2  Ricky van Wolfswinkel              5
3         Filip Djuricic              5
4         Radamel Falcao              4
5     Jonathan De Guzman              4
6             Almen Abdi              4
7        Ibrahim Afellay              4
8        Edson Braafheid              4
9            Eljero Elia              4
10       Danijel Pranjic              4

5. Which are the top 10 teams by sum of build up play attributes?
> buildUpPlay_top10teams
   team_api_id             team_long_name buildUpPlay
1         9804                     Torino         209
2         8600                    Udinese         205
3         8194         Fortuna Düsseldorf         198
4         8033 Podbeskidzie Bielsko-Biała         193
5         8245              Korona Kielce         192
6         8024                Widzew Łódź         190
7         8244                Widzew Łódź         190
8       208931                      Carpi         190
9         9830                  FC Nantes         189
10        7943                   Sassuolo         188

6. Which are the top 10 teams by sum of chance creation attributes?
> chanceCreation_top10teams
   team_api_id      team_long_name chanceCreation
1         8543               Lazio            220
2         8697    SV Werder Bremen            216
3         9875              Napoli            215
4         8178 Bayer 04 Leverkusen            210
5         8191             Burnley            210
6         8344        Cardiff City            210
7         8456     Manchester City            210
8         8485            Aberdeen            210
9         8548             Rangers            210
10        8586   Tottenham Hotspur            210


7. Which are the top 10 teams by sum of defense attributes?
> defense_top10teams
   team_api_id        team_long_name defense
1         1957 Jagiellonia Białystok     210
2         7794             SC Bastia     210
3         8021        Zagłębie Lubin     210
4         8197        Leicester City     210
5         8344          Cardiff City     210
6         8350  1. FC Kaiserslautern     210
7         8466           Southampton     210
8         8481     AS Nancy-Lorraine     210
9         8483             Blackpool     210
10        8521     Stade Brestois 29     210


8. Which are the top 10 teams by number of fielded players (i.e. number of players the team has sent to the field across all matches)?
> top10TeamsByFieldedPlayers
         team_long_name fielded_Players
1                 Genoa             139
2       Vitória Setúbal             123
3              SC Braga             122
4            Kilmarnock             116
5     Standard de Liège             115
6               Bologna             114
7     Vitória Guimarães             110
8             Sampdoria             109
9  Académica de Coimbra             109
10              Palermo             107

10. Which are the top 10 teams by number of scored goals?
> top10TeamsByGoals
      team_long_name total_goals
1       FC Barcelona         849
2     Real Madrid CF         843
3             Celtic         695
4   FC Bayern Munich         653
5                PSV         652
6               Ajax         647
7           FC Basel         619
8    Manchester City         606
9            Chelsea         583
10 Manchester United         582


References :: 

Dataset retrieved from https://www.kaggle.com/hugomathien/soccer/data
