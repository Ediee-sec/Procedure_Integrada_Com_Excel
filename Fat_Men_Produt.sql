CREATE PROCEDURE sp_Vendas_Produto_Por_Data
(		
		@codProduto	VARCHAR(10) = NULL
	,	@mesAno		VARCHAR(7) = NULL
)
AS
SELECT	
			PPT.Name			AS	'Descrição_Produto'
		,	PPT.ProductNumber	AS	'Codigo_Produto'
		,	PPO.OrderQty		AS	'Quantidade_Venda'
		,	PPO.UnitPrice		AS	'Preço_Unitário'
		,	PPO.LineTotal		AS	'Valor_Total'
		,	dbo.FormataData(DueDate)	AS	'Data_Venda'

FROM Purchasing.PurchaseOrderDetail PPO

INNER JOIN Production.Product PPT WITH (NOLOCK) ON
	PPT.ProductID = PPO.ProductID

WHERE	(PPT.ProductNumber = @codProduto OR @codProduto IS NULL) AND 
		(SUBSTRING(dbo.FormataData(DueDate), 4,8) = @mesAno OR @mesAno IS NULL)

