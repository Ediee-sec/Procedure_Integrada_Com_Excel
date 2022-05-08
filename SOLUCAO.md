### Primeiro Passo: Criar a Procedure

~~~sql
CREATE PROCEDURE sp_Vendas_Produto_Por_Data
(		-- Parâmetros
		@codProduto	VARCHAR(10) = NULL
	,	@mesAno		VARCHAR(7) = NULL
)
AS
SELECT	
            --Campos que serão exibidos para o gerente
			PPT.Name			AS	'Descrição_Produto'
		,	PPT.ProductNumber	AS	'Codigo_Produto'
		,	PPO.OrderQty		AS	'Quantidade_Compra'
		,	PPO.UnitPrice		AS	'Preço_Unitário'
		,	PPO.LineTotal		AS	'Valor_Total'
		,	dbo.FormataData(DueDate)	AS	'Data_Compra'

FROM Purchasing.PurchaseOrderDetail PPO WITH (NOLOCK) -- Tabela de detalhes da compra

INNER JOIN Production.Product PPT WITH (NOLOCK) ON --Tabela de detalhes do produto
	PPT.ProductID = PPO.ProductID

-- Condições, onde pode ser pesquisado com os parâmetros ou os parâmetros podem ser nulos
WHERE	(PPT.ProductNumber = @codProduto OR @codProduto IS NULL) AND 
		(SUBSTRING(dbo.FormataData(DueDate), 4,8) = @mesAno OR @mesAno IS NULL)
~~~
---
### Segundo Passo Integrar ao EXCEL.

1. *Abra o Excel, crie uma aba em branco e vá na opção Dados*

<img src = excel/passo1.png>

2. *Clique em Obter dados no canto superior esquerdo da tela*

<img src = excel/passo2.png>

3.*Em seguida selecione **Do Banco de Dados** --> **Do banco de Dados SQL SERVER***

<img src = excel/passo3.png>

4. *Com a tela aberta clique em opções avançadas*

<img src = excel/passo4.png>

5. *Preencha os campos de **Servidor**, **Banco de dados** e na **Intrução SQL**, coloque o nome da sua Procedure, como a nossa Procedure pode ter parâmetros nulos, passamos sem nenhum parâmetro para que seja retornado todos os produtos comprados*

<img src = excel/passo5.png>

6. *Clique em **Carregar**, se desejar alterar o tipo de dado, clique em transformador dados*

<img src = excel/passo6.png>

7. *Feito isso o Excel já está pronto para visualização*

<img src = excel/passo7.png>

8. *Está visualização fica conectada a Procedure, então sempre que os dados for atualizados no banco de dados, também podemos atualizar no excel de forma simples, clique na aba **Dados** e depois em **Atualizar Tudo**, fazendo assim o gerente de compras ter sempre os dados mais atualizados possiveis*

<img src = excel/passo8.png>

---

> Eai conseguiu fazer ? se sim me da um toque no [Linkedin](https://www.linkedin.com/in/emerson-santos-9358041b7/)