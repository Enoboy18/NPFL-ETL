WITH Streaks AS (
    SELECT 
        years,
        team,
        CASE 
            WHEN team = LAG(team) OVER (ORDER BY years) AND years = LAG(years) OVER (ORDER BY years) + 1 THEN 0
            ELSE 1
        END AS streak_start
    FROM npfl_champions
),
StreakGroups AS (
    SELECT 
        years,
        team,
        SUM(streak_start) OVER (ORDER BY years) AS streak_id
    FROM Streaks
)

SELECT 
    team,
    COUNT(*) AS consecutive_wins,
    MIN(years) AS start_year,
    MAX(years) AS end_year
FROM StreakGroups
GROUP BY team, streak_id
HAVING COUNT(*) > 1  -- Optional: to show streaks longer than one year
ORDER BY consecutive_wins DESC;
