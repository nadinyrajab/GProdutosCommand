<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@ page import="model.Produto"%>
<%@ page import="service.ProdutoService"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar Produto</title>
</head>
<body>
<nav class="navbar navbar-light bg-light" >
  	<a class="navbar-brand" href="home.jsp">Gerenciador de Produtos</a>
  	 <a class="nav-item nav-link" href="cadastrar.jsp">Cadastrar Produto</a>
	</nav>	
	
	<%
	Produto produto = new Produto();
	ProdutoService produtoService = new ProdutoService(); 
	int codigo = Integer.parseInt(request.getParameter("codigo"));	
	produto = produtoService.buscarProduto(codigo);	
	%>

<form action="controller.do" method="post">
	<div class="alert alert-primary" role="alert">
  	${requestScope.mensagem}
	</div>
	<input type="hidden" name="command" value="EditarProduto"> 
  <div class="form-group">
    <div class="col">
     <label>Id Produto</label>
      <input class="form-control" type="number"  name="codigo" placeholder="Código"  value= <%= produto.getCodigo() %>>
    </div>
    <div class="col">
     <label>Nome Produto</label>
      <input type="text" class="form-control" name="nome" placeholder="nome"  value= <%= produto.getNome() %>>
    </div>
     <div class="col">
      <label>Descrição do Produto</label>
      <input type="text" class="form-control" name="descricao" placeholder="Descrição"  value= <%= produto.getDescricao() %>>
    </div>
     <div class="col">
      <label>Valor do Produto</label>
      <input type="number" class="form-control"  step="0.1" name="valor"  placeholder="Valor"  value= <%= produto.getValor() %>>
    </div>
     <div class="col">
      <label>Quantidade do Produto</label>
      <input type="text" class="form-control"  name="estoque" placeholder="Quantidade"  value= <%= produto.getEstoque() %>>
    </div>
    
   <button class="btn btn-primary btn-block" type="submit">Editar</button>
    
  </div>
</form>


</body>
</html>