Drop database if exists DBSportStore2021158;
create database	DBSportStore2021158;

use DBSportStore2021158;

create table Categorias (
	codigoCategoria int not null auto_increment,
    descripcion varchar (150) not null,
    primary key PK_codigoCategoria (codigoCategoria)
);

create table Marcas(
	codigoMarca int not null auto_increment,
    descripcion varchar (150) not null,
    primary key PK_codigoMarca (codigoMarca)
);

create table Tallas (
	codigoTalla int not null auto_increment,
    descripcion varchar (150) not null,
    primary key PK_codigoTalla (codigoTalla)
);

create table Productos (
	codigoProducto int not null auto_increment,
    descripcion varchar (150) not null,
    existencia int not null,
    precioUnitario decimal (10,2) not null default 0.00,
    precioPorDocena decimal (10,2) not null default 0.00,
    precioPorMayor decimal (10,2) not null default 0.00,
    codigoCategoria int not null,
    codigoMarca int not null,
    codigoTalla int not null,
    primary key PK_codigoProducto (codigoProducto),
	 constraint FK_Productos_Categorias foreign key (codigoCategoria)
		references Categorias (codigoCategoria),
	constraint FK_Productos_Marcas foreign key (codigoMarca)
		references Marcas (codigoMarca),
	constraint FK_Productos_Tallas foreign key (codigoTalla)
		references Tallas (codigoTalla)
);

insert into Categorias (descripcion) values ('Ropa de Caballero');

-- ---- CRUD Create, Read, update, delete (Buscar)
-- -------------------------- Procedimientos Almacenados Categorias-------------------------------------
-- ----------------------------- Agregar Categorias---------------------------------------------------


Delimiter $$ 
	create procedure sp_AgregarCategoria (in descripcion varchar (150))
		begin
			insert into Categorias (descripcion) values (descripcion);
        end$$
Delimiter ;

call sp_AgregarCategoria ('Ropa de Caballero');
call sp_AgregarCategoria ('Ropa de bebe');


-- ----------------------------- Listar Categorias---------------------------------------------------
Delimiter $$ 
	create procedure sp_ListarCategorias ()
		begin
			select
				C. codigoCategoria,
                C. descripcion
				from Categorias C;
        end$$ 
Delimiter ;

call sp_ListarCategorias();

-- ----------------------------- Buscar Categorias---------------------------------------------------
Delimiter $$
	create procedure sp_BuscarCategoria (in codCat int )
		begin
			select
				C. codigoCategoria,
                C. descripcion
				from Categorias C where codigoCategoria = codCat;
        end $$
Delimiter ;

call sp_BuscarCategoria (1);
-- ----------------------------- Eliminar Categorias---------------------------------------------------
Delimiter $$
	create procedure sp_EliminarCategoria (in codCat int)
		begin
			delete from Categorias
				where codigoCategoria = codCat;
		end $$
Delimiter ;
call sp_EliminarCategoria (2);

-- ----------------------------- Editar Categorias--------------------------------------------------
Delimiter $$
	create procedure sp_EditarCategoria (in codCat int, in descr varchar (150))
		begin
			update Categorias
				set descripcion = descr
                where codigoCategoria = codCat;
        end $$
Delimiter ;

call sp_EditarCategoria(3, 'Ropa de Dama');
call sp_ListarCategorias();
-- -------------------------- Procedimientos Almacenados Tallas-------------------------------------
-- ----------------------------- Agregar Tallas---------------------------------------------------
Delimiter $$ 
	create procedure sp_AgregarTalla (in descripcion varchar (150))
		begin
			insert into Tallas (descripcion) values (descripcion);
        end$$
Delimiter ;

call sp_AgregarTalla ('L');
call sp_AgregarTalla ('S');
call sp_AgregarTalla ('M');
call sp_AgregarTalla ('SS');
call sp_AgregarTalla ('ML');
-- -------------------------- Procedimientos Almacenados Marcas-------------------------------------
-- ----------------------------- Agregar Marca---------------------------------------------------
Delimiter $$ 
	create procedure sp_AgregarMarca (in descripcion varchar (150))
		begin
			insert into Marcas (descripcion) values (descripcion);
        end$$
Delimiter ;

call sp_AgregarMarca ('Nike');
call sp_AgregarMarca ('Adidas');
call sp_AgregarMarca ('Puma');
call sp_AgregarMarca ('Arrow');
call sp_AgregarMarca ('RedBull');
-- -------------------------- Procedimientos Almacenados Productos-------------------------------------
-- ----------------------------- Agregar Producto---------------------------------------------------
Delimiter $$
	create procedure sp_AgregarProducto (in descripcion varchar (150), in existencia int, in codigoCategoria int, in codigoMarca int, in codigoTalla int)
		begin
			insert into Productos (descripcion, existencia, codigoCategoria, codigoMarca, codigoTalla)
				values (descripcion, existencia, codigoCategoria, codigoMarca, codigoTalla);
        end $$ 
Delimiter ;

call sp_AgregarProducto ('Pantalon De Lona', 10, 3, 1, 1);
call sp_AgregarProducto ('Pantalon De Lona', 7, 3, 2, 2);
call sp_AgregarProducto ('Pantalon De Lona', 20, 3, 3, 3);
call sp_AgregarProducto ('Pantalon De Lona', 14, 3, 4, 4);
call sp_AgregarProducto ('Pantalon De Lona', 18, 3, 5, 5);

call sp_AgregarProducto ('Playera', 14, 3, 1, 4);
call sp_AgregarProducto ('Playera', 8, 3, 2, 3);
call sp_AgregarProducto ('Playera', 27, 3, 3, 5);
call sp_AgregarProducto ('Playera', 16, 3, 4, 2);
call sp_AgregarProducto ('Playera', 18, 3, 5, 1);

call sp_AgregarProducto ('Sueter', 15, 3, 1, 5);
call sp_AgregarProducto ('Sueter', 9, 3, 2, 2);
call sp_AgregarProducto ('Sueter', 10, 3, 3, 1);
call sp_AgregarProducto ('Sueter', 11, 3, 4, 3);
call sp_AgregarProducto ('Sueter', 20, 3, 5, 4);

call sp_AgregarProducto ('Gorra', 20, 3, 1, 1);
call sp_AgregarProducto ('Gorra', 20, 3, 2, 2);
call sp_AgregarProducto ('Gorra', 20, 3, 3, 3);
call sp_AgregarProducto ('Gorra', 20, 3, 5, 5);

call sp_AgregarProducto ('Chumpa', 17, 3, 1, 5);
call sp_AgregarProducto ('Chumpa', 20, 3, 2, 2);
call sp_AgregarProducto ('Chumpa', 30, 3, 3, 1);
call sp_AgregarProducto ('Chumpa', 17, 3, 4, 3);
call sp_AgregarProducto ('Chumpa', 20, 3, 5, 4);

call sp_AgregarProducto ('Pantalon De Lona', 10, 1, 1, 1);
call sp_AgregarProducto ('Pantalon De Lona', 7, 1, 2, 2);
call sp_AgregarProducto ('Pantalon De Lona', 20, 1, 3, 3);
call sp_AgregarProducto ('Pantalon De Lona', 14, 1, 4, 4);
call sp_AgregarProducto ('Pantalon De Lona', 18, 1, 5, 5);

call sp_AgregarProducto ('Playera', 14, 1, 1, 4);
call sp_AgregarProducto ('Playera', 8, 1, 2, 3);
call sp_AgregarProducto ('Playera', 27, 1, 3, 5);
call sp_AgregarProducto ('Playera', 16, 1, 4, 2);
call sp_AgregarProducto ('Playera', 18, 1, 5, 1);

call sp_AgregarProducto ('Sueter', 15, 1, 1, 5);
call sp_AgregarProducto ('Sueter', 9, 1, 2, 2);
call sp_AgregarProducto ('Sueter', 10, 1, 3, 1);
call sp_AgregarProducto ('Sueter', 11, 1, 4, 3);
call sp_AgregarProducto ('Sueter', 20, 1, 5, 4);

call sp_AgregarProducto ('Gorra', 20, 1, 1, 1);
call sp_AgregarProducto ('Gorra', 20, 1, 2, 2);
call sp_AgregarProducto ('Gorra', 20, 1, 3, 3);
call sp_AgregarProducto ('Gorra', 20, 1, 5, 5);

call sp_AgregarProducto ('Chumpa', 17, 1, 1, 5);
call sp_AgregarProducto ('Chumpa', 20, 1, 2, 2);
call sp_AgregarProducto ('Chumpa', 30, 1, 3, 1);
call sp_AgregarProducto ('Chumpa', 17, 1, 4, 3);
call sp_AgregarProducto ('Chumpa', 20, 1, 5, 4);

select (200*0.4)+200 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (200*0.4)+200
			where codigoProducto = 1;
        
select (200*0.35)+200 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (200*0.35)+200
			where codigoProducto = 1;
        
select (200*0.25)+200 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (200*0.25)+200
			where codigoProducto = 1;
        
select (200*0.4)+200 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (200*0.4)+200
			where codigoProducto = 2;
        
select (200*0.35)+200 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (200*0.35)+200
			where codigoProducto = 2;
        
select (200*0.25)+200 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (200*0.25)+200
			where codigoProducto = 2;

        
select (200*0.4)+200 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (200*0.4)+200
			where codigoProducto = 3;
        
select (200*0.35)+200 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (200*0.35)+200
			where codigoProducto = 3;
        
select (200*0.25)+200 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (200*0.25)+200
			where codigoProducto = 3;

 select (200*0.4)+200 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (200*0.4)+200
			where codigoProducto = 4;
        
select (200*0.35)+200 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (200*0.35)+200
			where codigoProducto = 4;
        
select (200*0.25)+200 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (200*0.25)+200
			where codigoProducto = 4;

select (200*0.4)+200 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (200*0.4)+200
			where codigoProducto = 5;
        
select (200*0.35)+200 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (200*0.35)+200
			where codigoProducto = 5;
        
select (200*0.25)+200 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (200*0.25)+200
			where codigoProducto = 5;

select (115*0.4)+115 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (115*0.4)+115
			where codigoProducto = 6;
        
select (115*0.35)+115 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (115*0.35)+115
			where codigoProducto = 6;
        
select (115*0.25)+115 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (115*0.25)+115
			where codigoProducto = 6;
            
select (115*0.4)+115 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (115*0.4)+115
			where codigoProducto = 7;
        
select (115*0.35)+115 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (115*0.35)+115
			where codigoProducto = 7;
        
select (115*0.25)+115 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (115*0.25)+115
			where codigoProducto = 7;
            
select (115*0.4)+115 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (115*0.4)+115
			where codigoProducto = 8;
        
select (115*0.35)+115 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (115*0.35)+115
			where codigoProducto = 8;
        
select (115*0.25)+115 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (115*0.25)+115
			where codigoProducto = 8;
		
select (115*0.4)+115 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (115*0.4)+115
			where codigoProducto = 9;
        
select (115*0.35)+115 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (115*0.35)+115
			where codigoProducto = 9;
        
select (115*0.25)+115 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (115*0.25)+115
			where codigoProducto = 9;
            
select (115*0.4)+115 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (115*0.4)+115
			where codigoProducto = 10;
        
select (115*0.35)+115 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (115*0.35)+115
			where codigoProducto = 10;
        
select (115*0.25)+115 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (115*0.25)+115
			where codigoProducto = 10;      
            
select (150*0.4)+150 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (150*0.4)+150
			where codigoProducto = 11;
        
select (150*0.35)+150 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (150*0.35)+150
			where codigoProducto = 11;
        
select (150*0.25)+150 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (150*0.25)+150
			where codigoProducto = 11;      
            
select (150*0.4)+150 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (150*0.4)+150
			where codigoProducto = 12;
        
select (150*0.35)+150 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (150*0.35)+150
			where codigoProducto = 12;
        
select (150*0.25)+150 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (150*0.25)+150
			where codigoProducto = 12;      
            
select (150*0.4)+150 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (150*0.4)+150
			where codigoProducto = 13;
        
select (150*0.35)+150 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (150*0.35)+150
			where codigoProducto = 13;
        
select (150*0.25)+150 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (150*0.25)+150
			where codigoProducto = 13;      
            
select (150*0.4)+150 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (150*0.4)+150
			where codigoProducto = 14;
        
select (150*0.35)+150 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (150*0.35)+150
			where codigoProducto = 14;
        
select (150*0.25)+150 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (150*0.25)+150
			where codigoProducto = 14;      
            
select (150*0.4)+150 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (150*0.4)+150
			where codigoProducto = 15;
        
select (150*0.35)+150 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (150*0.35)+150
			where codigoProducto = 15;
        
select (150*0.25)+150 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (150*0.25)+150
			where codigoProducto = 15;      
    
select (75*0.4)+75 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (75*0.4)+75
			where codigoProducto = 16;
        
select (75*0.35)+75 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (75*0.35)+75
			where codigoProducto = 16;
        
select (75*0.25)+75 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (75*0.25)+75
			where codigoProducto = 16;      

select (75*0.4)+75 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (75*0.4)+75
			where codigoProducto = 17;
        
select (75*0.35)+75 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (75*0.35)+75
			where codigoProducto = 17;
        
select (75*0.25)+75 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (75*0.25)+75
			where codigoProducto = 17;  
            
select (75*0.4)+75 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (75*0.4)+75
			where codigoProducto = 18;
        
select (75*0.35)+75 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (75*0.35)+75
			where codigoProducto = 18;
        
select (75*0.25)+75 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (75*0.25)+75
			where codigoProducto = 18;      

select (75*0.4)+75 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (75*0.4)+75
			where codigoProducto = 19;
        
select (75*0.35)+75 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (75*0.35)+75
			where codigoProducto = 19;
        
select (75*0.25)+75 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (75*0.25)+75
			where codigoProducto = 19;      

select (75*0.4)+75 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (75*0.4)+75
			where codigoProducto = 20;
        
select (75*0.35)+75 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (75*0.35)+75
			where codigoProducto = 20;
        
select (75*0.25)+75 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (75*0.25)+75
			where codigoProducto = 20;      
 
 select (35*0.4)+35 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (35*0.4)+35
			where codigoProducto = 21;
        
select (35*0.35)+35 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (35*0.35)+35
			where codigoProducto = 21;
        
select (35*0.25)+35 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (35*0.25)+35
			where codigoProducto = 21;      

 select (35*0.4)+35 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (35*0.4)+35
			where codigoProducto = 22;
        
select (35*0.35)+35 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (35*0.35)+35
			where codigoProducto = 22;
        
select (35*0.25)+35 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (35*0.25)+35
			where codigoProducto = 22;      

 select (35*0.4)+35 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (35*0.4)+35
			where codigoProducto = 23;
        
select (35*0.35)+35 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (35*0.35)+35
			where codigoProducto = 23;
        
select (35*0.25)+35 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (35*0.25)+35
			where codigoProducto = 23;      

 select (35*0.4)+35 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (35*0.4)+35
			where codigoProducto = 24;
        
select (35*0.35)+35 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (35*0.35)+35
			where codigoProducto = 24;
        
select (35*0.25)+35 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (35*0.25)+35
			where codigoProducto = 24;      

 select (35*0.4)+35 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (35*0.4)+35
			where codigoProducto = 25;
        
select (35*0.35)+35 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (35*0.35)+35
			where codigoProducto = 25;
        
select (35*0.25)+35 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (35*0.25)+35
			where codigoProducto = 25;      

select (200*0.4)+200 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (200*0.4)+200
			where codigoProducto = 1;
        
select (200*0.35)+200 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (200*0.35)+200
			where codigoProducto = 1;
        
select (200*0.25)+200 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (200*0.25)+200
			where codigoProducto = 1;
        
select (200*0.4)+200 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (200*0.4)+200
			where codigoProducto = 2;
        
select (200*0.35)+200 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (200*0.35)+200
			where codigoProducto = 2;
        
select (200*0.25)+200 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (200*0.25)+200
			where codigoProducto = 2;

        
select (200*0.4)+200 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (200*0.4)+200
			where codigoProducto = 26;
        
select (200*0.35)+200 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (200*0.35)+200
			where codigoProducto = 26;
        
select (200*0.25)+200 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (200*0.25)+200
			where codigoProducto = 26;

 select (200*0.4)+200 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (200*0.4)+200
			where codigoProducto = 27;
        
select (200*0.35)+200 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (200*0.35)+200
			where codigoProducto = 27;
        
select (200*0.25)+200 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (200*0.25)+200
			where codigoProducto = 27;

select (200*0.4)+200 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (200*0.4)+200
			where codigoProducto = 28;
        
select (200*0.35)+200 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (200*0.35)+200
			where codigoProducto = 28;
        
select (200*0.25)+200 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (200*0.25)+200
			where codigoProducto = 28;

select (115*0.4)+115 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (115*0.4)+115
			where codigoProducto = 29;
        
select (115*0.35)+115 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (115*0.35)+115
			where codigoProducto = 29;
        
select (115*0.25)+115 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (115*0.25)+115
			where codigoProducto = 29;
            
select (115*0.4)+115 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (115*0.4)+115
			where codigoProducto = 30;
        
select (115*0.35)+115 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (115*0.35)+115
			where codigoProducto = 30;
        
select (115*0.25)+115 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (115*0.25)+115
			where codigoProducto = 30;
            
select (115*0.4)+115 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (115*0.4)+115
			where codigoProducto = 31;
        
select (115*0.35)+115 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (115*0.35)+115
			where codigoProducto = 31;
        
select (115*0.25)+115 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (115*0.25)+115
			where codigoProducto = 31;
		
select (115*0.4)+115 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (115*0.4)+115
			where codigoProducto = 32;
        
select (115*0.35)+115 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (115*0.35)+115
			where codigoProducto = 32;
        
select (115*0.25)+115 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (115*0.25)+115
			where codigoProducto = 32;
            
select (115*0.4)+115 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (115*0.4)+115
			where codigoProducto = 33;
        
select (115*0.35)+115 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (115*0.35)+115
			where codigoProducto = 33;
        
select (115*0.25)+115 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (115*0.25)+115
			where codigoProducto = 33;      
            
select (150*0.4)+150 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (150*0.4)+150
			where codigoProducto = 34;
        
select (150*0.35)+150 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (150*0.35)+150
			where codigoProducto = 34;
        
select (150*0.25)+150 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (150*0.25)+150
			where codigoProducto = 34;      
            
select (150*0.4)+150 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (150*0.4)+150
			where codigoProducto = 35;
        
select (150*0.35)+150 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (150*0.35)+150
			where codigoProducto = 35;
        
select (150*0.25)+150 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (150*0.25)+150
			where codigoProducto = 35;      
            
select (150*0.4)+150 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (150*0.4)+150
			where codigoProducto = 36;
        
select (150*0.35)+150 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (150*0.35)+150
			where codigoProducto = 36;
        
select (150*0.25)+150 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (150*0.25)+150
			where codigoProducto = 36;      
            
select (150*0.4)+150 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (150*0.4)+150
			where codigoProducto = 37;
        
select (150*0.35)+150 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (150*0.35)+150
			where codigoProducto = 37;
        
select (150*0.25)+150 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (150*0.25)+150
			where codigoProducto = 37;      
            
select (150*0.4)+150 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (150*0.4)+150
			where codigoProducto = 38;
        
select (150*0.35)+150 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (150*0.35)+150
			where codigoProducto = 38;
        
select (150*0.25)+150 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (150*0.25)+150
			where codigoProducto = 38;      
    
select (75*0.4)+75 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (75*0.4)+75
			where codigoProducto = 39;
        
select (75*0.35)+75 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (75*0.35)+75
			where codigoProducto = 39;
        
select (75*0.25)+75 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (75*0.25)+75
			where codigoProducto = 39;      

select (75*0.4)+75 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (75*0.4)+75
			where codigoProducto = 40;
        
select (75*0.35)+75 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (75*0.35)+75
			where codigoProducto = 40;
        
select (75*0.25)+75 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (75*0.25)+75
			where codigoProducto = 40;  
            
select (75*0.4)+75 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (75*0.4)+75
			where codigoProducto = 41;
        
select (75*0.35)+75 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (75*0.35)+75
			where codigoProducto = 41;
        
select (75*0.25)+75 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (75*0.25)+75
			where codigoProducto = 41;      

select (75*0.4)+75 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (75*0.4)+75
			where codigoProducto = 42;
        
select (75*0.35)+75 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (75*0.35)+75
			where codigoProducto = 42;
        
select (75*0.25)+75 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (75*0.25)+75
			where codigoProducto = 42;      

select (75*0.4)+75 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (75*0.4)+75
			where codigoProducto = 43;
        
select (75*0.35)+75 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (75*0.35)+75
			where codigoProducto = 43;
        
select (75*0.25)+75 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (75*0.25)+75
			where codigoProducto = 43;      
 
 select (35*0.4)+35 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (35*0.4)+35
			where codigoProducto = 44;
        
select (35*0.35)+35 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (35*0.35)+35
			where codigoProducto = 44;
        
select (35*0.25)+35 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (35*0.25)+35
			where codigoProducto = 44;      

 select (35*0.4)+35 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (35*0.4)+35
			where codigoProducto = 45;
        
select (35*0.35)+35 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (35*0.35)+35
			where codigoProducto = 45;
        
select (35*0.25)+35 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (35*0.25)+35
			where codigoProducto = 45;      

 select (35*0.4)+35 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (35*0.4)+35
			where codigoProducto = 46;
        
select (35*0.35)+35 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (35*0.35)+35
			where codigoProducto = 46;
        
select (35*0.25)+35 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (35*0.25)+35
			where codigoProducto = 46;      

 select (35*0.4)+35 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (35*0.4)+35
			where codigoProducto = 47;
        
select (35*0.35)+35 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (35*0.35)+35
			where codigoProducto = 47;
        
select (35*0.25)+35 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (35*0.25)+35
			where codigoProducto = 47;      

 select (35*0.4)+35 as PrecioUnitario;

	update Productos P 
		set PrecioUnitario = (35*0.4)+35
			where codigoProducto = 48;
        
select (35*0.35)+35 as PrecioPorDocena;

	update Productos P
		set PrecioPorDocena = (35*0.35)+35
			where codigoProducto = 48;
        
select (35*0.25)+35 as PrecioPorMayor;

	update Productos P
		set PrecioPorMayor = (35*0.25)+35
			where codigoProducto = 48;      

select * from Productos;

-- ----------------------------- Eliminar Tallas---------------------------------------------------
Delimiter $$
	create procedure sp_EliminarTalla (in codCat int)
		begin
			delete from Tallas
				where codigoTalla = codCat;
		end $$
Delimiter ;
call sp_EliminarTalla ();

-- ----------------------------- Eliminar Marcas---------------------------------------------------
Delimiter $$
	create procedure sp_EliminarMarca (in codCat int)
		begin
			delete from Marcas
				where codigoMarca = codCat;
		end $$
Delimiter ;
call sp_EliminarMarca ();

-- ----------------------------- Eliminar Productos---------------------------------------------------
Delimiter $$
	create procedure sp_EliminarProducto (in codCat int)
		begin
			delete from Productos
				where codigoProducto = codCat;
		end $$
Delimiter ;
call sp_EliminarProducto ();
