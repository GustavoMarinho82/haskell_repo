{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedRecordDot #-}
-- Permite que nomes de campos possam ser duplicados dentro de datas diferentes
-- E permite acessar os campos por obj.campo, permitindo acessar os campos com nomes repetidos sem ambiguidade

data Elemento = Neutro | Fogo | Agua | Eletrica deriving (Eq, Show)
data Tipo = Ataque | Defesa deriving (Eq, Show)

data Efeito = Efeito {
    potencia :: Double,
    tipo :: Tipo, 
    elemento :: Elemento
} deriving (Eq, Show)

-- tipo pra elemento elemento
data Arma = Arma {
    nome :: String,
    dano :: Double,
    elemento :: Elemento
} deriving (Eq, Show)

{-
As defesas sao em porcentagem/numeros relativos (estao num intervalo de 0 a 1). 
Uma criatura com 90% de defesa de fogo recebe só 10% do dano de ataques de fogo
-}
data Defesas = Defesas {
    neutra :: Double, 
    fogo :: Double, 
    agua :: Double, 
    eletrica :: Double
} deriving (Eq, Show)

data Horario = Manha | Tarde | Noite deriving (Eq, Show)
data Area = Litoral | Subterraneo | Masmorra | ConjuntosAgrarios | IlhasDoCeu deriving (Eq, Show)

data Criatura = Criatura {
    nome :: String,
    vida :: Double,
    arma :: Arma,
    defesas :: Defesas,
    efeitos :: [Efeito],
    areas :: [Area],      -- Atributo usado somente para inimigos
    horarios :: [Horario] -- Atributo usado somente para inimigos
} deriving (Eq, Show)

-- Esses types foram usados para identificar melhor nas assinaturas das funcoes o que eh personagem do que eh inimigo
type Personagem = Criatura
type Inimigo = Criatura

obter_defesa :: Criatura -> Elemento -> Double
obter_defesa criatura Neutro = criatura.defesas.neutra
obter_defesa criatura Fogo = criatura.defesas.fogo
obter_defesa criatura Agua = criatura.defesas.agua
obter_defesa criatura Eletrica = criatura.defesas.eletrica

data Item = Item {
    nome :: String,
    descricao :: String
} deriving (Eq, Show)

data SlotInventario = SlotItem Item | SlotArma Arma deriving (Eq, Show)
type Inventario = [SlotInventario]

obter_nome_slot :: SlotInventario -> String
obter_nome_slot (SlotItem item) = item.nome
obter_nome_slot (SlotArma arma) = arma.nome

todos_inimigos :: [Inimigo]
todos_inimigos = [] -- Ira conter todos os inimigos do jogo

-- Realiza um ataque que afeta todos os inimigos e retorna a lista atualizada dos inimigos
ataque_em_area :: Personagem -> [Inimigo] -> [Inimigo]
ataque_em_area personagem inimigos = map fn inimigos where
    fn :: Inimigo -> Inimigo
    fn inimigo = inimigo { vida = inimigo.vida - dano } where
        dano = max 1.0 (personagem.arma.dano * obter_multiplicador personagem Ataque personagem.arma.elemento * (1 - obter_defesa inimigo personagem.arma.elemento))

{- 
Pode ser usado em dois casos: 
1. Um inimigo usa um ataque que da um efeito negativo para a equipe; ou 
2. Um aliado usa uma magia que fornece um efeito positivo para os membros da equipe
-}
efeito_equipe :: [Personagem] -> Efeito -> [Personagem]
efeito_equipe equipe efeito = map (\personagem -> personagem { efeitos = efeito : personagem.efeitos}) equipe

-- Pesquisa itens no inventario pelo nome
pesquisar_inventario :: Inventario -> String -> Inventario
pesquisar_inventario inventario pesquisa = filter (\slot -> (obter_nome_slot slot == pesquisa)) inventario

-- Filtra os inimigos que podem aparecer numa area no horario atual
filtrar_inimigos :: Area -> Horario -> [Inimigo]
filtrar_inimigos area horario = filter (\inimigo -> (elem area inimigo.areas && elem horario inimigo.horarios)) todos_inimigos

-- Obtem o multiplicador total de todos os efeitos da criatura do tipo e elemento informados
obter_multiplicador :: Criatura -> Tipo -> Elemento -> Double
obter_multiplicador criatura tipo elemento = foldr fn 1.0 (efeitos criatura) where
    fn :: Efeito -> Double -> Double
    fn efeito acc = if (tipo /= efeito.tipo || elemento /= efeito.elemento) 
        then acc 
        else acc * (1.0 + efeito.potencia)

-- Remove as criaturas mortas. Eh para ser chamada apos cada ataque realizado
remover_mortos :: [Criatura] -> [Criatura]
remover_mortos = foldr fn [] where
    fn :: Criatura -> [Criatura] -> [Criatura]
    fn criatura acc = if (criatura.vida > 0) 
        then criatura : acc 
        else acc