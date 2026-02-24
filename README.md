# Library-Mangememnt
# As a beginner in data analysis, this project showcases practical SQL application in managing library operations. It simulates real-world data handling for books, members, and transactions, helping build a strong     foundation for analytics roles.

# Key Features Implemented
# Database Schema: Tables for Books (title, author, ISBN, category, availability), Members (ID, name, email, join_date, max_books), Issues (issue_id, book_id, member_id, issue_date, due_date, return_date, fine).

# Relationships: Foreign keys link Issues to Books and Members; constraints ensure data integrity (e.g., no over-issue beyond max_books . 
# Operations:

# DDL: CREATE, ALTER, DROP for tables.

# DML: INSERT sample data (50+ books, 20 members, 30 issues), UPDATE fines, DELETE expired issues.

# Queries: SELECT overdue books, total fines by category, most borrowed authors using JOINs, GROUP BY, HAVING.

# Core Entities and Attributes
# Entities represent key objects; attributes describe them, with primary keys underlined.

# Book: Book_ID (PK), Title, Author, ISBN, Category/Genre, Price, Status (available/issued).

# Member/User: Member_ID (PK), Name, Email, Phone, Address, Join_Date, Max_Books.

# Admin/Staff: Admin_ID (PK), Name, Email, Phone, Role/Position.

# Issue/Loan: Issue_ID (PK), Issue_Date, Due_Date, Return_Date, Fine_Amount.

# Reservation: Reservation_ID (PK), Reservation_Date.
