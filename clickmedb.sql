create database clickme;
use clickme;
CREATE TABLE messages(
id bigint not null primary key auto_increment,
content text not null);
Create table translations(
id bigint not null primary key auto_increment,
translated_content text not null,
language varchar(5) not null,
message_id bigint not null,
foreign key(message_id) references messages(id)
);


Insert Into messages (content) values("Hello this is a random message!");
insert Into translations (translated_content,language,message_id) values("مرحبا هذه رسالة عشوائية!","ar",1);
insert Into translations (translated_content,language,message_id) values("Hola, este es un mensaje aleatorio!","es",1);

Insert Into messages (content) values("Hello!, How are you?");
insert Into translations (translated_content,language,message_id) values("مرحبا، كيف حالك؟","ar",2);
insert Into translations (translated_content,language,message_id) values("¿Hola, cómo estás?","es",2);
