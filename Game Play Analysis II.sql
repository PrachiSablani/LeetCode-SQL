/*
Table: Activity

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+
(player_id, event_date) is the primary key of this table.
This table shows the activity of players of some game.
Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on some day using some device.
 

Write a SQL query that reports the device that is first logged in for each player.
*/

SELECT player_id, device_id 
FROM activity 
WHERE (player_id, event_date) IN (
                                SELECT player_id, MIN(event_date)
                                FROM activity 
                                GROUP BY player_id
                                 ) 
