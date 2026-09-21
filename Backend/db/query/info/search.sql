-- 搜尋候選人：可變更資料 INNER JOIN 固定資料，再 LEFT JOIN 對方的尋找條件。
-- 硬性條件放在 WHERE；語言、城市、年齡等加分在 Go 端計算，避免 N+1 查詢。

-- name: ListHobbyCandidates :many
SELECT
    c.user_id,
    c.city,
    c.speaklanguage,
    c.hobby_type,
    c.experience,
    f.age,
    f.gender,
    COALESCE(h.era, 0) AS want_era,
    h.city AS want_city,
    COALESCE(h.gender, '') AS want_gender,
    h.speaklanguage AS want_speaklanguage,
    COALESCE(h.find_type, '') AS want_type,
    COALESCE(h.experience, 0) AS want_experience,
    (h.user_id IS NOT NULL) AS has_pref
FROM canchangeinformation c
INNER JOIN fixinformation f ON f.user_id = c.user_id
LEFT JOIN hobby h ON h.user_id = c.user_id
WHERE c.user_id <> $1
  AND c.hobby_type = $2;

-- name: ListLoverCandidates :many
SELECT
    c.user_id,
    c.city,
    c.sexual,
    c.speaklanguage,
    f.age,
    f.gender,
    COALESCE(l.min_age, 0) AS want_min_age,
    COALESCE(l.max_age, 0) AS want_max_age,
    l.city AS want_city,
    COALESCE(l.gender, '') AS want_gender,
    COALESCE(l.sexual, '') AS want_sexual,
    l.speaklanguage AS want_speaklanguage,
    (l.user_id IS NOT NULL) AS has_pref
FROM canchangeinformation c
INNER JOIN fixinformation f ON f.user_id = c.user_id
LEFT JOIN lover l ON l.user_id = c.user_id
WHERE c.user_id <> $1
  AND ($2 = '' OR f.gender = $2)
  AND ($3 = 0 OR f.age >= $3 - 10)
  AND ($4 = 0 OR f.age <= $4 + 10);

-- name: ListAccompanyCandidates :many
SELECT
    c.user_id,
    c.speaklanguage,
    c.sociability,
    c.accompany_type,
    f.age,
    COALESCE(a.era, 0) AS want_era,
    a.speaklanguage AS want_speaklanguage,
    COALESCE(a.find_type, '') AS want_type,
    COALESCE(a.sociability, '') AS want_sociability,
    (a.user_id IS NOT NULL) AS has_pref
FROM canchangeinformation c
INNER JOIN fixinformation f ON f.user_id = c.user_id
LEFT JOIN accompany a ON a.user_id = c.user_id
WHERE c.user_id <> $1
  AND c.accompany_type = $2;
