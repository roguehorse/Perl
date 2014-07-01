#Keeper
#A simple password keeper
#Written in PerlTk using MySQL backend
#By Scott DuBois

Main Window
 Website - PK
 ID
 email
 password
 
  Buttons
   Enter
   Search - Requires Password
     Result:
       Return data
       No results found

#MySQL
  Keeper
   core
    (
      data_id int unsigned not null auto_increment
      primary key(data_id),
      site varchar(30) not null unique,
      user_id varchar(20) null,
      email varchar(50) null,
      pass varchar(50) not null
    ); 