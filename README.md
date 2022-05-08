#### Criando Stored Procedure SQL Server
---

 * **Estudo de Caso**
 
 > *Em uma empresa o gerente de compras pediu para você um relatório em excel das compras mensais por produto, você como DBA deve fornecer estes dados e integla-los ao excel.*
 
 > *Para está situação podemos fazer utilizando uma **View** que é mais comum para está finalidade, ou uma **Procedure**, neste caso em questão irei demonstrar com uma **Procedure***
 
 > Utilize o banco de dados publico acadêmico da Microsoft [AdventureWorks](https://docs.microsoft.com/pt-br/sql/samples/adventureworks-install-configure?view=sql-server-ver15&tabs=ssms), no link em questão já tem o passo a passo de como recuperar o banco de dados para o Management Studio
 ----
 ### **Dicas**

* **Tabelas**
1. *Tabela **Purchasing.PurchaseOrderDetail**, detalhes da compra*
2. *Tabela **Production.Product**, detalhes dos produtos*

* **Campos**

1. *Descrição do produto **Name** da Tabela **Production.Product***
2. *Número do Produto **ProductNumber** da tabela **Production.Product***
3. *Quantidade da venda **OrderQty** da tabela **Purchasing.PurchaseOrderDetail***
4. *Preço unitário do produto **UnitPrice** da tabela **Purchasing.PurchaseOrderDetail***
5. *Valor total da Venda **LineTotal** da tabela **Purchasing.PurchaseOrderDetail***
6. *Data da venda **DueDate** da tabela **Purchasing.PurchaseOrderDetail***

* **Parâmetros**

1. *Deve receber o mês e o ano no seguinte formato EX:**"05/2022"**, para tal deve utilizar algumas funções padrõesdo SQL, o [CONVERT](https://docs.microsoft.com/pt-br/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15), para alterar o fomato da data do padrão SQL, para o formato Brasileiro e Função [SUBSTRING](https://docs.microsoft.com/pt-br/sql/t-sql/functions/substring-transact-sql?view=sql-server-ver15), para cortarmos a data e utilizar apenas o trecho **05/2022**, desconsiderando o dia. Coluna **DueDate**, este parâmetro pode ser nulo*
> A outras formas de pegar a informação do mês e ano apenas, porém para este caso seguiremos dessa forma

2. *Deve receber como parâmetro o número do produto que é um ID único, Coluna **ProductNumber**, este parâmetro pode ser nulo*

---

> Nesta mesma pasta terá um arquivo chamado **SOLUÇÃO**, onde apresento a forma correta de resolver este problema, porém aconselho que tente fazer sozinho o máximo que conseguir. **"A prática leva a perfeição"**