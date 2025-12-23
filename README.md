# Vehicle Rental System – Database Design & SQL Queries

## 📌 Project Overview

This project is a **Vehicle Rental System database** designed to demonstrate core database concepts such as:

- Entity Relationship Diagram (ERD)
- Primary and Foreign Keys
- One-to-Many and Many-to-One relationships
- SQL queries using `JOIN`, `NOT EXISTS`, `WHERE`, `GROUP BY`, and `HAVING`

The system manages **members**, **vehicles**, and **bookings** in a realistic rental business scenario.

---

## 🗄️ Database Schema Overview

### Tables Used

1. **member**

   - Stores user information
   - Supports roles: `admin` and `customer`
   - Each email is unique

2. **vehicles**

   - Stores vehicle details
   - Tracks vehicle type and availability status

3. **bookings**
   - Stores rental bookings
   - Links members and vehicles using foreign keys
   - Tracks booking duration and status

---

## 🔗 ERD Relationships

- **One-to-Many**:  
  One member can have multiple bookings
- **Many-to-One**:  
  Multiple bookings can reference the same vehicle
- **Logical One-to-One**:  
  Each booking connects exactly one member and one vehicle

The ERD clearly shows:

- Primary Keys (PK)
- Foreign Keys (FK)
- Relationship cardinality
- Status fields

---

## 📂 SQL Queries Explanation

All queries are written in **simple PostgreSQL syntax** and are included in the `queries.sql` file.

### Query 1: INNER JOIN

**Purpose:**  
Retrieve booking details along with customer name and vehicle name.

**Concepts Used:**  
`INNER JOIN`

---

### Query 2: NOT EXISTS

**Purpose:**  
Find vehicles that have **never been booked**.

**Concepts Used:**  
`NOT EXISTS`

---

### Query 3: WHERE

**Purpose:**  
Retrieve all **available vehicles of a specific type** (e.g., cars).

**Concepts Used:**  
`SELECT`, `WHERE`

---

### Query 4: GROUP BY & HAVING

**Purpose:**  
Find vehicles that have **more than 2 bookings**.

**Concepts Used:**  
`GROUP BY`, `HAVING`, `COUNT`

---

## 📁 Repository Structure

📦 vehicle-rental-system
┣ 📄 README.md
┣ 📄 queries.sql
