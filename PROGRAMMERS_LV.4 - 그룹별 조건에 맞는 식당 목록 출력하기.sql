SELECT mp.MEMBER_NAME, rr.REVIEW_TEXT, TO_CHAR(rr.REVIEW_DATE, 'YYYY-MM-DD') REVIEW_DATE
FROM MEMBER_PROFILE mp
JOIN REST_REVIEW rr ON mp.MEMBER_ID = rr.MEMBER_ID
WHERE mp.MEMBER_ID IN (SELECT MEMBER_ID
                        FROM REST_REVIEW
                        GROUP BY MEMBER_ID
                        HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                                            FROM REST_REVIEW
                                            GROUP BY MEMBER_ID))
ORDER BY 3, 2