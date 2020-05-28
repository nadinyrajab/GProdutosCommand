<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.util.ArrayList"%>
<%@ page import="model.Produto"%>
<%@ page import="service.ProdutoService"%>
<!DOCTYPE html>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<html>
<head>
<meta charset="utf-8">
<title> Lista Produtos</title>
</head>
<body>
<body>
	<nav class="navbar navbar-light bg-light" >
  	<a class="navbar-brand" href="home.jsp">Gerenciador de Produtos</a>
  	 <a class="nav-item nav-link" href="cadastrar.jsp">Cadastrar Produto</a>
	</nav>	
	<div class="alert alert-primary" role="alert">
  	${requestScope.mensagem}
	</div>

<div>
	<table class="table table-hover">
		<tr>
			<th scope="col">Código Produto</th>
			<th scope="col">Nome</th>
			<th scope="col">Descrição</th>
			<th scope="col">Valor</th>	
			<th scope="col">Estoque</th>
			<th scope="col">Alterar</th>
			<th scope="col">Excluir</th>
		</tr>

			
		<%
			ArrayList<Produto> lista;
			ProdutoService pds = new ProdutoService();		
			lista = pds.listarProdutos();
			
			for (Produto produto : lista){	
		%>
				
		<tr>
			<td><%=produto.getCodigo() %></td>
			<td><%=produto.getNome() %></td>
			<td><%= produto.getDescricao() %></td>
			<td>R$ <%= produto.getValor() %></td>
			<td><%= produto.getEstoque() %></td>			
			<td><a href="editar.jsp?codigo=<%=produto.getCodigo()%>">Editar</a></td>
			<td><a href="controller.do?command=ExcluirProduto&codigo=<%=produto.getCodigo()%>">Deletar</a></td>		
			
		</tr>					
				
		<%}%>			
				
		</table>
		</div>

</body>
</html>