class Produto < ApplicationRecord
  has_one_attached :enviar_imagem
  has_rich_text :descricao
  validates :nome, presence:true
end
