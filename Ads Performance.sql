/*
Table: Ads

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| ad_id         | int     |
| user_id       | int     |
| action        | enum    |
+---------------+---------+
(ad_id, user_id) is the primary key for this table.
Each row of this table contains the ID of an Ad, the ID of a user and the action taken by this user regarding this Ad.
The action column is an ENUM type of ('Clicked', 'Viewed', 'Ignored').
 

A company is running Ads and wants to calculate the performance of each Ad.

Performance of the Ad is measured using Click-Through Rate (CTR) where:



Write an SQL query to find the ctr of each Ad.

Round ctr to 2 decimal points. Order the result table by ctr in descending order and by ad_id in ascending order in case of a tie.
*/
SELECT t.ad_id,
       IF(t.num_clicks + t.num_views = 0, 0, ROUND(100*t.num_clicks/(t.num_clicks + t.num_views), 2)) AS ctr
FROM
    (SELECT ad_id,
             SUM(CASE WHEN action = 'Clicked' THEN 1 ELSE 0 END) AS num_clicks,
             SUM(CASE WHEN action = 'Viewed' THEN 1 ELSE 0 END) AS num_views
      FROM Ads
      GROUP BY ad_id ) t
ORDER BY ctr DESC, t.ad_id ASC
