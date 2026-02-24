create database project;
use project;
create table tbl_publisher
(publisher_name varchar(50) primary key,publisher_address
varchar(255),publisher_phone varchar(20));
select * from tbl_publisher;



create table borrower(borrower_cardNO tinyint primary key
,borrower_name varchar(50),borrower_address varchar(255),
borrower_phone varchar(20));
select * from borrower;

create table library_branch(branch_ID tinyint primary key
auto_increment,branch_name varchar(20),branch_address 
varchar(50));
select * from library_branch;


create table book(book_ID tinyint primary key,
book_title varchar(255), publisher_name varchar(50) ,
foreign key (publisher_name) references tbl_publisher(
publisher_name));
select * from book;



create table book_authors(author_ID tinyint primary key 
auto_increment,book_id tinyint,author_name varchar(50),
foreign key (book_id) references book(book_id));
select * from book_authors;



create table book_loans(loans_ID tinyint primary key auto_increment,
book_ID tinyint,branch_ID tinyint,card_no tinyint,date_out varchar(20),
due_date varchar(20), foreign key (book_ID) references book(book_id),
foreign key (branch_ID) references library_branch(branch_ID),
foreign key (card_no) references borrower(borrower_cardNO));
select * from book_loans; 



create table book_copies(copies_ID tinyint primary key auto_increment,
book_ID tinyint,branch_ID tinyint,no_of_copies tinyint,
foreign key (book_id) references book(book_id),
foreign key (branch_id) references library_branch(branch_ID));
select * from book_copies;



### How many copies of the book titled "The Lost Tribe" are owned 
###by the library branch whose name is "Sharpstown"?
select b.book_title,l.branch_name,count(*)
from book b 
inner join 
book_copies bc 
on b.book_id = bc.book_id
inner join 
library_branch l 
on l.branch_ID = bc.branch_ID 
where b.book_title = 'the lost tribe' and 
l.branch_name = 'sharpstown' 
group by 
b.book_title,l.branch_name;


## How many copies of the book titled "The Lost Tribe" are 
## owned by each library branch?
select b.book_title,l.branch_name,count(*)
from book b 
inner join 
book_copies bc 
on b.book_id = bc.book_id
inner join 
library_branch l 
on l.branch_ID = bc.branch_ID 
where b.book_title = 'the lost tribe' 
group by 
b.book_title,l.branch_name;



## Retrieve the names of all borrowers who do not have any books checked out
select borrower_name from borrower where borrower_cardNo not in 
(select distinct card_no from book_loans);



## For each book that is loaned out from the "Sharpstown" 
## branch and whose DueDate is 2/3/18, retrieve the book title, 
## the borrower's name, and the borrower's address.
select b.book_title,br.borrower_name,br.borrower_address 
from book_loans bl inner join library_branch lb using(branch_id) 
inner join book b using(book_id)
inner join borrower br on br.borrower_cardNo = bl.card_no
where lb.branch_name = 'Sharpstown' and bl.due_date = '2/3/18';



##For each library branch, retrieve the branch name and the total
## number of books loaned out from that branch.
select lb.branch_name,count(*) from book_loans bl inner join library_branch lb using(branch_id)
group by lb.branch_name;



## Retrieve the names, addresses, and number of books checked 
## out for all borrowers who have more than five books checked out.
with cte_1 as(select br.borrower_name,count(br.borrower_name) as 'no_of_books_
checked_out' from book_loans bl inner join borrower br on bl.card_no = br.
borrower_cardNo group by br.borrower_name)
select * from cte_1 where  'no_of_books_
checked_out'> 5;



## For each book authored by "Stephen King", retrieve 
## the title and the number of copies owned by the library branch whose 
## name is "Central".
select b.book_title,lb.branch_name,count(lb.branch_name) as 'no_of_books' from book_authors ba inner join book b using(book_id)
inner join book_copies bc using(book_id)
inner join library_branch lb using(branch_id)
where lb.branch_name = 'central' and ba.author_name = 'Stephen King'
group by lb.branch_name,b.book_title;


