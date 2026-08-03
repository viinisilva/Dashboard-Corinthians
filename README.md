# 📊 Dashboard Corinthians 2025 — Power BI + MySQL

Dashboard interativo para análise da temporada 2025 do Sport Club Corinthians, aplicando conceitos de Business Intelligence, modelagem de dados e visualização.

Projeto desenvolvido como prática pré-estágio em Análise de Dados / TI, cobrindo o ciclo completo: coleta de dados via API, modelagem em banco relacional, tratamento no Power Query, criação de medidas DAX e construção de um dashboard multi-página.

---

## 🖼️ Preview

> Adicione aqui os prints das 3 páginas do dashboard (Visão Geral, Jogadores, Destaque).

---

## 🚀 Sobre o projeto

O painel acompanha o desempenho do Corinthians ao longo da temporada 2025, com dados reais coletados via API pública de futebol, cobrindo:

- Brasileirão Série A
- Copa do Brasil (campeão)
- Campeonato Paulista (campeão)
- Copa Libertadores e Copa Sul-Americana

O projeto foi dividido em 3 páginas navegáveis:

1. **Visão Geral** — KPIs gerais da temporada (jogos, vitórias, saldo de gols, aproveitamento), gols por competição, aproveitamento por competição, evolução mensal de gols marcados x sofridos, e distribuição de resultados (vitória/empate/derrota).
2. **Jogadores** — ranking de artilharia, assistências da temporada, participação em gols (G+A) com tratamento de empates via DAX, total de partidas disputadas por jogador, gols por posição, e slicer interativo de filtro por posição.
3. **Destaque** — conquistas da temporada (Paulistão e Copa do Brasil), recorde de público, comando técnico, e ranking de prêmios individuais conquistados pelo elenco.

---

## 🛠️ Tecnologias utilizadas

- **Power BI** — construção do dashboard, DAX, Power Query
- **MySQL Workbench** — modelagem do banco de dados e consultas SQL
- **API de dados esportivos** (via RapidAPI) — coleta dos dados reais da temporada

---

## 🗄️ Estrutura do banco de dados

O banco `corinthians_dashboard` é composto por três tabelas principais:

```sql
jogadores (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) UNIQUE,
  posicao VARCHAR(50),
  gols_temporada INT,
  assistencias_temporada INT,
  premios_2025 INT
)

jogos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  data DATE,
  adversario VARCHAR(100),
  competicao VARCHAR(50),
  gols_pro INT,
  gols_contra INT,
  resultado VARCHAR(10)
)

gols (
  id INT PRIMARY KEY AUTO_INCREMENT,
  jogo_id INT,
  jogador_id INT,
  minuto INT,
  FOREIGN KEY (jogo_id) REFERENCES jogos(id),
  FOREIGN KEY (jogador_id) REFERENCES jogadores(id)
)
```

> A tabela `gols` foi modelada para granularidade gol-a-gol, mas simplificada na prática (ranking de artilharia calculado por total agregado em `jogadores`), já que a API utilizada não disponibiliza o evento individual de cada gol.

---

## 📐 Principais medidas DAX

Exemplo da medida usada para identificar o(s) líder(es) de participação em gols (gols + assistências), com tratamento correto de empates:

```dax
Líderes em G+A =
VAR MaiorValor = [Maior G+A]
RETURN
CONCATENATEX(
    FILTER(
        ALLSELECTED(Jogadores[nome]),
        [Participação em Gols] = MaiorValor
    ),
    Jogadores[nome],
    UNICHAR(10)
)
```

---

## 📈 Principais aprendizados

- Modelagem relacional (chaves primárias e estrangeiras) aplicada na prática
- Consumo de API REST e tratamento de dados JSON para popular um banco relacional
- Construção de medidas DAX com tratamento de contexto de filtro (`ALLSELECTED`, `FILTER`, `CALCULATE`)
- Boas práticas de identidade visual e consistência de design em dashboards multi-página
- Importância da validação cruzada de dados (conferência de totais, checagem de fontes) antes de publicar

---

## 👤 Autor

**Vinicius Silva**
Estudante de Sistemas de Informação (UNIP Alphaville) | Estagiário de TI — Banco Bradesco Financiamentos
[GitHub](https://github.com/viinisilva)
