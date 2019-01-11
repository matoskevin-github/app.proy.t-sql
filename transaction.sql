go
create procedure usp_insertShippers
@CompanyName nvarchar(40),
@Phone nvarchar(24)
AS
BEGIN TRAN
BEGIN TRY
   INSERT INTO Shippers VALUES (@CompanyName,@Phone);    
   COMMIT TRAN
   SELECT CAST('REGISTRO GUARDADO' AS VARCHAR(20)) AS MENSAJE
END TRY
BEGIN CATCH
  ROLLBACK TRAN
  SELECT CAST(ERROR_MESSAGE()  AS  VARCHAR(MAX)) AS MENSAJE
END CATCH
GO

exec usp_insertShippers 'ROMI GAS','(01) 520-1610'



