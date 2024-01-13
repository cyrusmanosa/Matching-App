-- name: CreatePayment :one
INSERT INTO payment (
    pay_id,
    fullname,
    payment_type,
    amount,
    product
) VALUES (
    $1,$2,$3,$4,$5
) RETURNING *;

-- name: GetPayment :one
SELECT * FROM payment
WHERE pay_id = $1;