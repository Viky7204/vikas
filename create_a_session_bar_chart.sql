WITH temp1 AS (
    SELECT '[0-5>' AS bin
    UNION ALL
    SELECT '[5-10>'
    UNION ALL
    SELECT '[10-15>'
    UNION ALL
    SELECT '15 or more'
),
temp2 AS (
    SELECT 
        CASE 
            WHEN duration < 300 THEN '[0-5>'
            WHEN duration >= 300 AND duration < 600 THEN '[5-10>'
            WHEN duration >= 600 AND duration < 900 THEN '[10-15>'
            ELSE '15 or more'
        END AS bin,
        COUNT(*) AS total
    FROM Sessions
    GROUP BY bin
)
SELECT 
    temp1.bin, 
    COALESCE(temp2.total, 0) AS total 
FROM temp1 
LEFT JOIN temp2 ON temp1.bin = temp2.bin;
