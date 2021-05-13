1- Qual a maior oferta, a menor oferta e o valor médio dessas ofertas?
 
SELECT max(vloferta), min(vloferta), avg(vloferta) FROM oferta

2- Qual o maior preço, o menor preço, a soma de todos os preços e a média de preço dos imóveis? 

SELECT max(vlpreco), min(vlpreco), sum(vlpreco), avg(vlpreco) FROM imovel


3- Qual o maior preço, o menor preço e a soma de todos os preços por bairro?

SELECT cdbairro, max(vlpreco), min(vlpreco), sum(vlpreco), avg(vlpreco) FROM imovel
   GROUP BY cdbairro
   ORDER BY cdbairro asc

4- Qual a quantidade de imóveis vendidos por vendedor?

SELECT cdvendedor, count(cdimovel) as qtde_imoveis_vendidos FROM imovel
   GROUP BY cdvendedor
   ORDER BY cdvendedor

5- Qual a diferença entre o maior e o menor preço de imóvel? 

SELECT (max(vlpreco) - min(vlpreco)) as Diferenca_Maior_Menor FROM imovel


6- Qual o valor mínimo acima de 10.000 que cada vendedor conseguiu obter em suas respectivas vendas?

SELECT cdvendedor, min(vlpreco) FROM imovel
   WHERE vlpreco > 10000
   GROUP BY cdvendedor
   ORDER BY cdvendedor

7- Informe o nome do comprador, a quantidade de ofertas para cada um e a média dessas ofertas.

SELECT C.cdcomprador, nmcomprador, avg(vloferta) as media_ofertas, count(OF.cdcomprador) as qtde_ofertas 
   FROM comprador C INNER JOIN oferta OF
   ON C.cdcomprador = OF.cdcomprador
   group by C.cdcomprador
   order by C.cdcomprador


8- Qual a quantidade de ofertas nos anos de 2000 a 2002?

SELECT count(vloferta) FROM oferta
   WHERE (extract(year from dtoferta)) in (2000,2001,2002)

9- Listar os imóveis e suas respectivas faixas de preço

SELECT I.cdimovel, I.nmendereco, I.sgestado, I.vlpreco, F.nmfaixa FROM imovel I 
INNER JOIN faixa_imovel F
ON I.cdfaixa = F.cdfaixa
order by I.cdimovel

10- Listar os imóveis dispoívels, exibindo endereço e o estado

SELECT cdimovel as Cod_Imovel, nmendereco as Endereco, sgestado as ESTADO from Imovel
WHERE sgestado LIKE 'SP'