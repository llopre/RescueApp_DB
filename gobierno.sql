use das

 --execute insertar_usuario '20374028978', 'Lucas', 'Lopez', 'llopez@hotmail.com' , '12345678' 
 --execute insertar_usuario '20335849337', 'Juan', 'Martinez', 'jm@gmail.com', '12abcdef'
 
 --execute get_usuario '20374028978', '12345678'
 --execute get_all_usuarios
 
 go

create table USUARIOS
(
cuil              varchar(15) not null,
nombre            varchar(30) not null,
apellido          varchar(30) not null,
email             varchar(50) not null,
clave             varchar(20) not null,
email_verificado  varchar(1) default 'N',
constraint PK_usuarios primary key (cuil),
check (email_verificado in ('S', 'N'))
)



go
---------------------------
----- Procedimientos ------


create procedure insertar_usuario
( 
	@cuil              varchar(15),
    @nombre            varchar(30),
    @apellido          varchar(30),
    @email             varchar(50),
    @clave             varchar(20)
)
as
begin

	insert into usuarios (cuil, nombre, apellido, email, clave)
	values (@cuil, @nombre, @apellido, @email, @clave)

end
go



create or alter procedure get_usuario
(
	@cuil  varchar(15),
	@clave varchar(20)
)
as
begin

	select *
	from usuarios
	where cuil  = @cuil
	 and  clave = @clave

end
go



create or alter procedure get_all_usuarios
as
begin
	select *
	from usuarios
end
go



