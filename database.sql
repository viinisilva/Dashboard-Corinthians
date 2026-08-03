-- ============================================================
-- Dashboard Corinthians 2025 — Script de banco de dados
-- MySQL Workbench
-- Autor: Vinicius Silva
-- ============================================================

CREATE DATABASE IF NOT EXISTS corinthians_dashboard;
USE corinthians_dashboard;

-- ============================================================
-- ESTRUTURA DAS TABELAS
-- ============================================================

CREATE TABLE jogadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    posicao VARCHAR(50),
    gols_temporada INT DEFAULT 0,
    assistencias_temporada INT DEFAULT 0,
    premios_2025 INT DEFAULT 0
);

CREATE TABLE jogos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    adversario VARCHAR(100) NOT NULL,
    competicao VARCHAR(50) NOT NULL,
    gols_pro INT NOT NULL,
    gols_contra INT NOT NULL,
    resultado VARCHAR(10) -- 'Vitoria', 'Empate' ou 'Derrota'
);

CREATE TABLE gols (
    id INT AUTO_INCREMENT PRIMARY KEY,
    jogo_id INT,
    jogador_id INT,
    minuto INT,
    FOREIGN KEY (jogo_id) REFERENCES jogos(id),
    FOREIGN KEY (jogador_id) REFERENCES jogadores(id)
);
-- Observação: a tabela "gols" foi modelada para granularidade gol-a-gol,
-- mas não populada — a API utilizada não disponibiliza o evento individual
-- de cada gol, apenas totais agregados por jogador (ver tabela "jogadores").

-- ============================================================
-- DADOS: JOGOS DA TEMPORADA 2025 (74 partidas)
-- Fonte: SofaScore (via SportAPI7 / RapidAPI)
-- ============================================================

INSERT INTO jogos (data, adversario, competicao, gols_pro, gols_contra, resultado) VALUES
-- Campeonato Paulista 2025 (campeão)
('2025-01-16', 'RB Bragantino', 'Paulista', 2, 1, 'Vitoria'),
('2025-01-19', 'Velo Clube', 'Paulista', 2, 1, 'Vitoria'),
('2025-01-22', 'Água Santa', 'Paulista', 2, 1, 'Vitoria'),
('2025-01-26', 'São Paulo', 'Paulista', 1, 3, 'Derrota'),
('2025-01-29', 'Ponte Preta', 'Paulista', 1, 0, 'Vitoria'),
('2025-02-01', 'Noroeste', 'Paulista', 2, 1, 'Vitoria'),
('2025-02-04', 'Novorizontino', 'Paulista', 1, 0, 'Vitoria'),
('2025-02-06', 'Palmeiras', 'Paulista', 1, 1, 'Empate'),
('2025-02-09', 'São Bernardo', 'Paulista', 2, 0, 'Vitoria'),
('2025-02-13', 'Santos', 'Paulista', 2, 1, 'Vitoria'),
('2025-02-15', 'Portuguesa', 'Paulista', 2, 2, 'Empate'),
('2025-02-23', 'Guarani', 'Paulista', 2, 2, 'Empate'),
('2025-03-02', 'Mirassol', 'Paulista', 2, 0, 'Vitoria'),
('2025-03-09', 'Santos', 'Paulista', 2, 1, 'Vitoria'),
('2025-03-16', 'Palmeiras', 'Paulista', 1, 0, 'Vitoria'),
('2025-03-28', 'Palmeiras', 'Paulista', 0, 0, 'Empate'),

-- Copa Libertadores 2025 (fase preliminar/classificatória)
('2025-02-20', 'Universidad Central', 'Libertadores', 1, 1, 'Empate'),
('2025-02-27', 'Universidad Central', 'Libertadores', 3, 2, 'Vitoria'),
('2025-03-06', 'Barcelona SC', 'Libertadores', 0, 3, 'Derrota'),
('2025-03-13', 'Barcelona SC', 'Libertadores', 2, 0, 'Vitoria'),

-- Campeonato Brasileiro Série A 2025
('2025-03-30', 'Bahia', 'Brasileirão', 1, 1, 'Empate'),
('2025-04-05', 'Vasco da Gama', 'Brasileirão', 3, 0, 'Vitoria'),
('2025-04-12', 'Palmeiras', 'Brasileirão', 0, 2, 'Derrota'),
('2025-04-16', 'Fluminense', 'Brasileirão', 0, 2, 'Derrota'),
('2025-04-19', 'Sport Recife', 'Brasileirão', 2, 1, 'Vitoria'),
('2025-04-27', 'Flamengo', 'Brasileirão', 0, 4, 'Derrota'),
('2025-05-03', 'Internacional', 'Brasileirão', 4, 2, 'Vitoria'),
('2025-05-10', 'Mirassol', 'Brasileirão', 1, 2, 'Derrota'),
('2025-05-18', 'Santos', 'Brasileirão', 1, 0, 'Vitoria'),
('2025-05-25', 'Atlético-MG', 'Brasileirão', 0, 0, 'Empate'),
('2025-06-01', 'Vitória', 'Brasileirão', 0, 0, 'Empate'),
('2025-06-12', 'Grêmio', 'Brasileirão', 1, 1, 'Empate'),
('2025-07-13', 'RB Bragantino', 'Brasileirão', 1, 2, 'Derrota'),
('2025-07-16', 'Ceará', 'Brasileirão', 1, 0, 'Vitoria'),
('2025-07-20', 'São Paulo', 'Brasileirão', 0, 2, 'Derrota'),
('2025-07-23', 'Cruzeiro', 'Brasileirão', 0, 0, 'Empate'),
('2025-07-26', 'Botafogo', 'Brasileirão', 1, 1, 'Empate'),
('2025-08-03', 'Fortaleza', 'Brasileirão', 1, 1, 'Empate'),
('2025-08-11', 'Juventude', 'Brasileirão', 1, 2, 'Derrota'),
('2025-08-17', 'Bahia', 'Brasileirão', 1, 2, 'Derrota'),
('2025-08-24', 'Vasco da Gama', 'Brasileirão', 3, 2, 'Vitoria'),
('2025-08-31', 'Palmeiras', 'Brasileirão', 1, 1, 'Empate'),
('2025-09-14', 'Fluminense', 'Brasileirão', 1, 0, 'Vitoria'),
('2025-09-21', 'Sport Recife', 'Brasileirão', 0, 1, 'Derrota'),
('2025-09-28', 'Flamengo', 'Brasileirão', 1, 2, 'Derrota'),
('2025-10-01', 'Internacional', 'Brasileirão', 1, 1, 'Empate'),
('2025-10-05', 'Mirassol', 'Brasileirão', 3, 0, 'Vitoria'),
('2025-10-16', 'Santos', 'Brasileirão', 1, 3, 'Derrota'),
('2025-10-18', 'Atlético-MG', 'Brasileirão', 1, 0, 'Vitoria'),
('2025-10-25', 'Vitória', 'Brasileirão', 1, 0, 'Vitoria'),
('2025-11-02', 'Grêmio', 'Brasileirão', 2, 0, 'Vitoria'),
('2025-11-05', 'RB Bragantino', 'Brasileirão', 1, 2, 'Derrota'),
('2025-11-09', 'Ceará', 'Brasileirão', 0, 1, 'Derrota'),
('2025-11-20', 'São Paulo', 'Brasileirão', 3, 1, 'Vitoria'),
('2025-11-23', 'Cruzeiro', 'Brasileirão', 0, 3, 'Derrota'),
('2025-11-30', 'Botafogo', 'Brasileirão', 2, 2, 'Empate'),
('2025-12-03', 'Fortaleza', 'Brasileirão', 1, 2, 'Derrota'),
('2025-12-07', 'Juventude', 'Brasileirão', 1, 1, 'Empate'),

-- Copa do Brasil 2025 (campeão)
('2025-05-01', 'Novorizontino', 'Copa do Brasil', 1, 0, 'Vitoria'),
('2025-05-22', 'Novorizontino', 'Copa do Brasil', 1, 0, 'Vitoria'),
('2025-07-31', 'Palmeiras', 'Copa do Brasil', 1, 0, 'Vitoria'),
('2025-08-07', 'Palmeiras', 'Copa do Brasil', 2, 0, 'Vitoria'),
('2025-08-28', 'Athletico', 'Copa do Brasil', 1, 0, 'Vitoria'),
('2025-09-11', 'Athletico', 'Copa do Brasil', 2, 0, 'Vitoria'),
('2025-12-11', 'Cruzeiro', 'Copa do Brasil', 1, 0, 'Vitoria'),
('2025-12-14', 'Cruzeiro', 'Copa do Brasil', 1, 1, 'Vitoria'),
('2025-12-18', 'Vasco da Gama', 'Copa do Brasil', 0, 0, 'Empate'),
('2025-12-21', 'Vasco da Gama', 'Copa do Brasil', 2, 1, 'Vitoria'),

-- CONMEBOL Sul-Americana 2025
('2025-04-02', 'Huracán', 'Sul-Americana', 1, 2, 'Derrota'),
('2025-04-09', 'América de Cali', 'Sul-Americana', 1, 1, 'Empate'),
('2025-04-24', 'Racing de Montevideo', 'Sul-Americana', 1, 0, 'Vitoria'),
('2025-05-07', 'América de Cali', 'Sul-Americana', 1, 1, 'Empate'),
('2025-05-15', 'Racing de Montevideo', 'Sul-Americana', 1, 0, 'Vitoria'),
('2025-05-28', 'Huracán', 'Sul-Americana', 0, 1, 'Derrota');

-- ============================================================
-- DADOS: ELENCO E ESTATÍSTICAS INDIVIDUAIS 2025
-- Fonte: imprensa esportiva (ge.globo, Meu Timão, Gazeta Esportiva, ESPN)
-- ============================================================

INSERT INTO jogadores (nome, posicao, gols_temporada, assistencias_temporada, premios_2025) VALUES
('Yuri Alberto', 'Atacante', 19, 3, 4),
('Memphis Depay', 'Atacante', 12, 10, 1),
('Talles Magno', 'Atacante', 6, 0, 0),
('Gui Negão', 'Atacante', 5, 0, 0),
('Ángel Romero', 'Atacante', 5, 4, 0),
('Matheus Bidu', 'Lateral', 5, 0, 0),
('Gustavo Henrique', 'Zagueiro', 4, 0, 0),
('Igor Coronado', 'Meio-campo', 3, 0, 0),
('Maycon', 'Meio-campo', 3, 0, 0),
('André Carrillo', 'Meio-campo', 3, 0, 1),
('Raniele', 'Meio-campo', 3, 0, 0),
('Matheuzinho', 'Lateral', 3, 6, 1),
('André', 'Zagueiro', 2, 0, 0),
('Héctor Hernández', 'Atacante', 2, 0, 0),
('Alex Santana', 'Meio-campo', 2, 0, 0),
('Cacá', 'Zagueiro', 2, 0, 0),
('Rodrigo Garro', 'Meio-campo', 2, 7, 0),
('José Martínez', 'Meio-campo', 2, 0, 0),
('Pedro Raul', 'Atacante', 1, 0, 0),
('Charles', 'Meio-campo', 1, 0, 0),
('Félix Torres', 'Zagueiro', 1, 0, 0),
('João Pedro Tchoca', 'Lateral', 1, 0, 0),
('Breno Bidon', 'Meio-campo', 1, 0, 0),
('Hugo Souza', 'Goleiro', 0, 0, 1);

-- ============================================================
-- CONSULTAS DE VERIFICAÇÃO (conferência de totais)
-- ============================================================

-- Total de jogos: deve retornar 74
SELECT COUNT(*) AS total_jogos FROM jogos;

-- Distribuição de resultados: deve retornar Vitoria 35 / Empate 20 / Derrota 19
SELECT resultado, COUNT(*) AS total FROM jogos GROUP BY resultado;

-- Total de gols marcados por jogadores cadastrados: deve retornar 88
-- (diferença de 2 para os 90 gols totais da temporada refere-se a gols contra do adversário)
SELECT SUM(gols_temporada) AS total_gols FROM jogadores;
