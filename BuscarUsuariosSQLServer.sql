Create or alter PROC [dbo].[buscarUsuario] 
	@User varchar(45),
	@Pass varchar(45)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
BEGIN
	IF (select count(*) from dbo.Administradores where usuario = @User) >= 1
		begin
			IF (select count(*) from dbo.Administradores where usuario = @User and pass=@Pass)>=1
			begin 
				select 'Correcto', (select id from dbo.Administradores where usuario = @User and pass=@Pass), -1, 1;
				return;
			end
			else
			begin
				select 'password incorrecta';
				return;
			end
		end

	IF (select count(*) from FGAM...Cliente where usuario = @User) >= 1
		begin
			IF (select count(*) from FGAM...Cliente where usuario = @User and pass=@Pass)>=1
			begin 
				select 'Correcto', (select id from FGAM...Cliente where usuario = @User and pass=@Pass), 1, 0;
				return;
			end
			else
			begin
				select 'password incorrecta';
				return;
			end
		end
	IF (select count(*) from FNorte...Cliente where usuario = @User) >= 1
		begin
			IF (select count(*) from FNorte...Cliente where usuario = @User and pass=@Pass)>=1
			begin 
				select 'Correcto', (select id from FNorte...Cliente where usuario = @User and pass=@Pass), 2, 0;
				return;
			end
			else
			begin
				select 'password incorrecta';
				return;
			end
		end
	IF (select count(*) from FSur...Cliente where usuario = @User) >= 1
		begin
			IF (select count(*) from FSur...Cliente where usuario = @User and pass=@Pass)>=1
			begin 
				select 'Correcto', (select id from FSur...Cliente where usuario = @User and pass=@Pass), 3, 0;
				return;
			end
			else
			begin
				select 'password incorrecta';
				return;
			end
		end
	select 'Usuario no encontrado'
	return
end