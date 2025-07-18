# Documentação do Projeto - Checkpoint 3: Modelagem e Orquestração

## Sumário

- [Documentação do Projeto - Checkpoint 3: Modelagem e Orquestração](#documentação-do-projeto---checkpoint-3-modelagem-e-orquestração)
  - [Sumário](#sumário)
  - [Introdução](#introdução)
  - [Requisitos](#requisitos)
  - [Configuração do Ambiente](#configuração-do-ambiente)
    - [1. Ativando o Ambiente Virtual](#1-ativando-o-ambiente-virtual)
    - [2. Carregando as Variáveis de Ambiente](#2-carregando-as-variáveis-de-ambiente)
  - [Execução do Projeto](#execução-do-projeto)
  - [Regras de Negócio](#regras-de-negócio)
  - [Testes](#testes)
  - [Documentação Automática do dbt](#documentação-automática-do-dbt)
  - [Mantenha seus arquivos `.yml` bem preenchidos para uma documentação mais rica e](#mantenha-seus-arquivos-yml-bem-preenchidos-para-uma-documentação-mais-rica-e)
  - [Observações Finais](#observações-finais)

---

## Introdução

Este projeto tem como objetivo a modelagem e orquestração de dados utilizando DBT (Data Build Tool) e Python, seguindo as melhores práticas de engenharia de dados. O projeto foi desenvolvido como parte do Checkpoint 3 do curso da Indicium.

---

## Requisitos

- Python 3.8+
- DBT
- Dependências listadas em `requirements.txt`
- Variáveis de ambiente configuradas no arquivo `.env`
- Conta e workspace no Databricks
- Token de acesso Databricks

---

## Configuração do Ambiente

Antes de executar o projeto, é fundamental garantir que o ambiente virtual está ativado e que as variáveis de ambiente estão devidamente carregadas.

### 1. Ativando o Ambiente Virtual

No terminal, navegue até a raiz do projeto e execute:

```bash
source .venv/bin/activate
```

Isso garante que todas as dependências do projeto sejam utilizadas corretamente.

### 2. Carregando as Variáveis de Ambiente

Com o ambiente virtual ativado, carregue as variáveis de ambiente definidas no arquivo `.env`:

```bash
export $(cat .env | xargs)
```

**Atenção:**  
Esses dois passos são obrigatórios para garantir o funcionamento correto do projeto.

---

## Execução do Projeto

Após ativar o ambiente virtual e carregar as variáveis de ambiente, siga as instruções abaixo para rodar o projeto:

1. **Instale as dependências (caso ainda não tenha feito):**
   ```bash
   pip install -r requirements.txt
   ```

2. **Compile e execute os modelos dbt:**
   ```bash
   dbt run
   ```

3. **Execute os testes dbt:**
   ```bash
   dbt test
   ```

4. **(Opcional) Limpe artefatos:**
   ```bash
   dbt clean
   ```

---

## Regras de Negócio

O projeto implementa as seguintes regras de negócio:

1. **Modelagem dos Dados:**  
   - Estruturação dos dados brutos em modelos dimensionais e factuais.
   - Garantia de integridade referencial entre tabelas.
   - Aplicação de transformações necessárias para padronização e limpeza dos dados.

2. **Orquestração:**  
   - Execução automatizada das etapas de extração, transformação e carga (ETL).
   - Sequenciamento das tarefas para garantir a ordem correta de processamento.

3. **Validação dos Dados:**  
   - Implementação de testes de qualidade para garantir a consistência dos dados.
   - Checagem de duplicidades, valores nulos e integridade dos relacionamentos.

4. **Segurança e Configuração:**  
   - Utilização de variáveis de ambiente para proteger informações sensíveis (senhas, chaves de acesso, etc).
   - Isolamento do ambiente de execução via virtualenv.

---

## Testes

O projeto possui uma suíte de testes automatizados para garantir a qualidade e robustez das implementações.

- **Total de testes:** 29
- **Status:** Todos os 29 testes passaram com sucesso, comprovando a estabilidade e aderência às regras de negócio estabelecidas.

---
## Documentação Automática do dbt

O dbt permite gerar documentação automática do projeto, incluindo modelos, fontes, testes e linhagem dos dados.

Para gerar e visualizar a documentação:

```bash
dbt docs generate
dbt docs serve
```

O comando `dbt docs serve` abrirá uma interface web interativa (por padrão em http://localhost:8080) mostrando toda a documentação do seu projeto, incluindo descrições, relacionamentos e dependências entre os modelos.

Mantenha seus arquivos `.yml` bem preenchidos para uma documentação mais rica e
--
## Observações Finais

- **Sempre ative o ambiente virtual e carregue as variáveis de ambiente antes de rodar qualquer comando.**
- Em caso de dúvidas ou problemas, consulte os logs de execução ou entre em contato com o responsável pelo projeto.
- Certifique-se de que as tabelas fontes (raw) estejam disponíveis no Databricks.
- O arquivo `dbt_project.yml` já está configurado para separar schemas e materializações por camada.
- O diretório `target/` não deve ser versionado (veja `.gitignore`).

---

**Exemplo de execução completa:**

```bash
cd ~/Documents/indicium/checkpoint3/aw_dbt
source .venv/bin/activate
export $(cat .env | xargs)
dbt run
dbt test