create table hello.bankdetails(acc_id numeric(13) primary key,username varchar(30),balance numeric(10));
insert into hello.bankdetails(acc_id,username,balance) values(3434545464,"D.Chaitanya",40000);
select *from hello.bankdetails;
create table hello.translist(serialno numeric(10),acc_id numeric(13),amount numeric(10),foreign key(acc_id) references hello.bankdetails(acc_id)); 
select *from hello.translist;
DELIMITER $$
DROP PROCEDURE IF EXISTS `hello`.`get_transcation_list`$$

CREATE PROCEDURE `hello`.`get_transcation_list`(IN accountid numeric(13))
BEGIN
	
	select amount from hello.translist where serialno>((select count(*) from hello.translist)-5) and acc_id=accountid;

END$$
DELIMITER ;
