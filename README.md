Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices


# Projeto dbt: AdventureWorks

Este projeto utiliza o [dbt](https://www.getdbt.com/) para modelagem e orquestração de dados no Databricks, seguindo a arquitetura de camadas (staging, marts).

## Pré-requisitos

- Python 3.7+
- Conta e workspace no Databricks
- Token de acesso Databricks
- [dbt-core](https://pypi.org/project/dbt-core/) e [dbt-databricks](https://pypi.org/project/dbt-databricks/)

## Instalação

1. Instale as dependências:
   ```sh
   pip install dbt-core dbt-databricks
   ```

2. Configure o arquivo `.env` na raiz do projeto com as variáveis:
   ```
   DATABRICKS_TOKEN=seu_token
   DATABRICKS_HOST=https://seu-workspace.cloud.databricks.com
   DATABRICKS_HTTP_PATH=/sql/1.0/warehouses/xxxxxx
   ```

3. Configure o arquivo `~/.dbt/profiles.yml` conforme o perfil `aw_dbt`:
   ```yaml
   aw_dbt:
     target: dev
     outputs:
       dev:
         type: databricks
         catalog: ted_dev
         schema: dev_guilherme_sobrinho
         host: "{{ env_var('DATABRICKS_HOST') }}"
         http_path: "{{ env_var('DATABRICKS_HTTP_PATH') }}"
         token: "{{ env_var('DATABRICKS_TOKEN') }}"
         threads: 1
         connect_timeout: 10
   ```

## Estrutura do Projeto

- `models/staging/`: Camada de staging (views)
- `models/marts/`: Camada de marts (tables)
- `models/marts/_marts.yml`: Schema e testes dos modelos marts
- `tests/`: Testes customizados SQL
- `analyses/`, `macros/`, `seeds/`, `snapshots/`: Diretórios reservados para análises, macros, seeds e snapshots

## Como rodar

1. Compile e execute os modelos:
   ```sh
   dbt run
   ```

2. Execute os testes:
   ```sh
   dbt test
   ```

3. (Opcional) Limpe artefatos:
   ```sh
   dbt clean
   ```

## Observações

- Certifique-se de que as tabelas fontes (raw) estejam disponíveis no Databricks.
- O arquivo `dbt_project.yml` já está configurado para separar schemas e materializações por camada.
- O diretório `target/` não deve ser versionado (veja `.gitignore`).

## Recursos úteis

- [Documentação oficial do dbt](https://docs.getdbt.com/docs/introduction)
- [Comunidade dbt no Slack](https://community.getdbt.com/)
- [Blog dbt](https://blog.getdbt.com/)

---
```# Projeto dbt: AdventureWorks

Este projeto utiliza o [dbt](https://www.getdbt.com/) para modelagem e orquestração de dados no Databricks, seguindo a arquitetura de camadas (staging, marts).

## Pré-requisitos

- Python 3.7+
- Conta e workspace no Databricks
- Token de acesso Databricks
- [dbt-core](https://pypi.org/project/dbt-core/) e [dbt-databricks](https://pypi.org/project/dbt-databricks/)

## Instalação

1. Instale as dependências:
   ```sh
   pip install dbt-core dbt-databricks
   ```

2. Configure o arquivo `.env` na raiz do projeto com as variáveis:
   ```
   DATABRICKS_TOKEN=seu_token
   DATABRICKS_HOST://seu-workspace.cloud.databricks.com
   DATABRICKS_HTTP_PATH=/sql/1.0/warehouses/xxxxxx
   ```

3. Configure o arquivo `~/.dbt/profiles.yml` conforme o perfil `aw_dbt`:
   ```yaml
   aw_dbt:
     target: dev
     outputs:
       dev:
         type: databricks
         catalog: ted_dev
         schema: dev_guilherme_sobrinho
         host: "{{ env_var('DATABRICKS_HOST') }}"
         http_path: "{{ env_var('DATABRICKS_HTTP_PATH') }}"
         token: "{{ env_var('DATABRICKS_TOKEN') }}"
         threads: 1
         connect_timeout: 10
   ```

## Estrutura do Projeto

- `models/staging/`: Camada de staging (views)
- `models/marts/`: Camada de marts (tables)
- `models/marts/_marts.yml`: Schema e testes dos modelos marts
- `tests/`: Testes customizados SQL
- `analyses/`, `macros/`, `seeds/`, `snapshots/`: Diretórios reservados para análises, macros, seeds e snapshots

## Como rodar

1. Compile e execute os modelos:
   ```sh
   dbt run
   ```

2. Execute os testes:
   ```sh
   dbt test
   ```

3. (Opcional) Limpe artefatos:
   ```sh
   dbt clean
   ```

## Observações

- Certifique-se de que as tabelas fontes (raw) estejam disponíveis no Databricks.
- O arquivo `dbt_project.yml` já está configurado para separar schemas e materializações por camada.
- O diretório `target/` não deve ser versionado (veja `.gitignore`).

## Recursos úteis

- [Documentação oficial do dbt](https://docs.getdbt.com/docs/introduction)
- [Comunidade dbt no Slack](https://community.getdbt.com/)







export $(cat .env | xargs) 
python3 -m venv .venv  
source .venv/bin/activate     