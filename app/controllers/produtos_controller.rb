class ProdutosController < ApplicationController
    
    def index
        @produtos = Produto.order(:nome).limit 5
    end
    
    def create
        valores = params.require(:produto).permit :nome, :preco, :descricao, :quantidade
        produto = Produto.create valores
    end
end
