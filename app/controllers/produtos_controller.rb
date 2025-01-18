class ProdutosController < ApplicationController
  before_action :set_produto, only: %i[show edit update destroy]
  allow_unauthenticated_access only: %i[index show]
  

  def index
    @produtos = Produto.all
  end

  def show
  end

  def new
    @produto = Produto.new
  end

  def create
    @produto = Produto.new(produto_params)
    if @produto.save
      redirect_to @produto
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @produto.update(produto_params)
      redirect_to @produto
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @produto.destroy
    redirect_to produtos_path
  end

  private

    def produto_params
      params.expect(produto: [ :nome, :descricao, :enviar_imagem ])
    end

    def set_produto
      @produto = Produto.find(params[:id])
    end

end
