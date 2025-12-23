CREATE TABLE IF NOT EXISTS member (
    member_id SERIAL PRIMARY KEY,
    role VARCHAR(20) NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    CHECK (role IN ('admin', 'customer'))
);

CREATE TABLE IF NOT EXISTS vehicles (
    vehicle_id SERIAL PRIMARY KEY,
    vehicle_name VARCHAR(100) NOT NULL,
    vehicle_type VARCHAR(20) NOT NULL,
    model VARCHAR(100) NOT NULL,
    registration_number VARCHAR(50) UNIQUE NOT NULL,
    price_per_day DECIMAL(10,2) NOT NULL,
    availability_status VARCHAR(20) NOT NULL,
    CHECK (vehicle_type IN ('car','bike','truck')),
    CHECK (availability_status IN ('available','rented','maintenance'))
);

CREATE TABLE IF NOT EXISTS bookings (
    booking_id SERIAL PRIMARY KEY,
    member_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    booking_status VARCHAR(20) NOT NULL,
    total_cost DECIMAL(10,2) NOT NULL,
    CHECK (booking_status IN ('pending','confirmed','completed','cancelled')),
    FOREIGN KEY (member_id) REFERENCES member(member_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
);

-- INSERT INTO member (member_id, role, name, email, password, phone) VALUES
-- (1, 'customer', 'Alice', 'alice@example.com', 'password123', '1234567890'),
-- (2, 'admin', 'Bob', 'bob@example.com', 'password123', '0987654321'),
-- (3, 'customer', 'Charlie', 'charlie@example.com', 'password123', '1122334455');

-- INSERT INTO vehicles (
--     vehicle_id,
--     vehicle_name,
--     vehicle_type,
--     model,
--     registration_number,
--     price_per_day,
--     availability_status
-- ) VALUES
-- (1, 'Toyota Corolla', 'car', '2022', 'ABC-123', 50, 'available'),
-- (2, 'Honda Civic', 'car', '2021', 'DEF-456', 60, 'rented'),
-- (3, 'Yamaha R15', 'bike', '2023', 'GHI-789', 30, 'available'),
-- (4, 'Ford F-150', 'truck', '2020', 'JKL-012', 100, 'maintenance');

-- INSERT INTO bookings (
--     booking_id,
--     member_id,
--     vehicle_id,
--     start_date,
--     end_date,
--     booking_status,
--     total_cost
-- ) VALUES
-- (1, 1, 2, '2023-10-01', '2023-10-05', 'completed', 240),
-- (2, 1, 2, '2023-11-01', '2023-11-03', 'completed', 120),
-- (3, 3, 2, '2023-12-01', '2023-12-02', 'confirmed', 60),
-- (4, 1, 1, '2023-12-10', '2023-12-12', 'pending', 100);

-- Query 1: INNER JOIN
SELECT
    b.booking_id,
    m.name AS customer_name,
    v.vehicle_name,
    b.start_date,
    b.end_date,
    b.booking_status
FROM bookings b
INNER JOIN member m ON b.member_id = m.member_id
INNER JOIN vehicles v ON b.vehicle_id = v.vehicle_id;

-- Query 2: NOT EXISTS
SELECT *
FROM vehicles v
WHERE NOT EXISTS (
    SELECT 1
    FROM bookings b
    WHERE b.vehicle_id = v.vehicle_id
);

-- Query 3: WHERE
SELECT *
FROM vehicles
WHERE vehicle_type = 'car'
  AND availability_status = 'available';

-- Query 4: GROUP BY + HAVING
SELECT
    v.vehicle_name,
    COUNT(b.booking_id) AS total_bookings
FROM vehicles v
JOIN bookings b ON v.vehicle_id = b.vehicle_id
GROUP BY v.vehicle_name
HAVING COUNT(b.booking_id) > 2;