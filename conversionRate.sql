SELECT
  masked_user_id,
  (COUNT(is_make_order)/SUM(session_start_global_count)) AS conv_rate,
FROM
  `I_CID_02.activity`
WHERE
  is_make_order = TRUE
  AND session_start_global_count <> 0
GROUP BY
  masked_user_id
ORDER BY
  conv_rate ASC;
