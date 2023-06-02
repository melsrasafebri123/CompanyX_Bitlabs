SELECT 
  (SUM(session_start_global_count)/SUM(session_start_global_count)) AS step1,
  ((SUM(search_count)/SUM(session_start_global_count)) + (SUM(view_microsite_count)/SUM(session_start_global_count)))  AS step2,
  (SUM(view_pdp_count)/SUM(session_start_global_count)) AS step3,
  (SUM(input_kode_promo_count)/SUM(session_start_global_count)) AS step4,
  ((SUM(wishlist_count)/SUM(session_start_global_count)) + (SUM(pilih_metode_pembayaran_count)/SUM(session_start_global_count))) AS step5,
  (COUNT(is_make_order)/SUM(session_start_global_count)) AS step6
FROM
  `I_CID_02.activity` A
INNER JOIN
  `I_CID_02.user` B
ON
  A.masked_user_id = B.masked_user_id
WHERE
  is_make_order = true
  AND session_start_global_count<>0;
