SELECT FLAVOR
FROM(SELECT FLAVOR, SUM(TOTAL_ORDER)
    FROM(SELECT *
        FROM FIRST_HALF
        UNION
        SELECT *
        FROM JULY)
    GROUP BY FLAVOR
    ORDER BY 2 DESC)
WHERE ROWNUM <= 3