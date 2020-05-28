package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Produto;
import service.ProdutoService;

public class ExcluirProduto implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Produto produto = new Produto();

		int codigoProduto = Integer.parseInt(request.getParameter("codigo"));

		produto.setCodigo(codigoProduto);

		ProdutoService produtoService = new ProdutoService();

		produtoService.deletarProduto(produto);

		request.setAttribute("mensagem", "O produto foi excluido com sucesso!");

		RequestDispatcher view = request.getRequestDispatcher("home.jsp");
		view.forward(request, response);

	}

}
