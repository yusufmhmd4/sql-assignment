SELECT
    V.vehicle_id,
    O.product_name,
    SUM(O.quantity) AS Total_Quantity
FROM
    Vehicles AS V
JOIN
    Routes AS R ON V.vehicle_id = R.vehicle_id
JOIN
    Customers AS C ON R.route_id = C.route_id
JOIN
    Orders AS O ON C.customer_id = O.customer_id
WHERE
    O.order_status = 'confirmed'
    AND O.delivery_date BETWEEN '2024-02-20' AND '2024-02-28'
GROUP BY
    V.vehicle_id,
    O.product_name;
