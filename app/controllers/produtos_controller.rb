class ProdutosController < ApplicationController
    
    def index
        @produtos = Produto.order(:nome).limit 5
    end
    
    def create
        valores = params.require(:produto).permit :nome, :preco, :descricao, :quantidade, :departamento_id
        @produto = Produto.new valores
        
        if @produto.save
            flash[:notice] = "Produto criado com sucesso"
            redirect_to root_url
        else
            render :new
        end
    end
    
    def destroy
        id = params[:id]
        Produto.destroy id
        
        redirect_to root_url
    end
    
    def find
        @query_string = params[:nome]
        @produtos = Produto.where "nome like ?", "%#{@query_string}%"
    end
    
    def new
        @produto = Produto.new
        @departamentos = Departamento.all
    end
end
