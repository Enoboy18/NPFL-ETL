-- Previous Title winners still playing in the 2024/2025 Season
SELECT nc.years, ns.team
FROM npfl_champions AS nc
JOIN npfl_season_24_25 AS ns
ON nc.team = ns.team;

-- Clubs squad size and stadium Capacity
SELECT 
    ns.team,
    ns.location,
    COUNT(pd.team) AS players_count
FROM npfl_season_24_25 AS ns
JOIN player_data AS pd ON ns.team = pd.team
GROUP BY ns.team, ns.location
ORDER BY players_count DESC;

SELECT 
    team,
    stadium,
    capacity
FROM npfl_season_24_25
ORDER BY capacity;

-- Total number of players on the database 
SELECT count(player) FROM player_data;

-- Most Title Winners
SELECT 
    team,
    COUNT(team) AS num_championships,
    GROUP_CONCAT(years ORDER BY years) AS years
FROM npfl_champions
GROUP BY team
ORDER BY num_championships DESC;
