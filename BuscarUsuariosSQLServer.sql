Create or alter PROC [dbo].[buscarUsuario] 
	@User varchar(45),
	@Pass varchar(45)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
BEGIN
	IF (select count(*) from FGAM...Cliente where usuario = @User) >= 1
		begin
			IF (select count(*) from FGAM...Cliente where usuario = @User and pass=@Pass)>=1
			begin 
				select 'Correcto';
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
				select 'Correcto';
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
				select 'Correcto';
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