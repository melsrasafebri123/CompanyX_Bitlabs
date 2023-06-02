SELECT
  city,
  (COUNT(is_make_order)/SUM(view_pdp_count)) AS conv_rate,
FROM
  `I_CID_02.activity` A
INNER JOIN
  `I_CID_02.user` B
ON
  A.masked_user_id = B.masked_user_id
WHERE
  is_make_order = TRUE
  AND view_pdp_count <> 0
GROUP BY
  city
ORDER BY
  conv_rate ASC;
