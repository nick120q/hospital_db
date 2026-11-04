# 🏥 Hospital DB – Banco de Dados Hospitalar

## 📌 Sobre o projeto

O **Hospital DB** é um projeto acadêmico desenvolvido utilizando MySQL, com o objetivo de criar um banco de dados relacional para o gerenciamento das informações de um hospital.

O sistema permite armazenar, organizar e consultar informações sobre pacientes, médicos, quartos, internações, consultas e prescrições médicas.

## 🎯 Objetivo

Desenvolver um banco de dados hospitalar utilizando os conceitos de modelagem relacional, criação de tabelas, relacionamentos entre entidades e consultas SQL para solucionar necessidades de diferentes setores de um hospital.

## 🗂️ Modelo do Banco de Dados (DER)

O diagrama abaixo representa a estrutura do banco de dados, apresentando as tabelas, seus atributos e os relacionamentos entre elas.



## 📋 Estrutura das tabelas

O banco de dados é composto por seis tabelas principais:

| Tabela      | Descrição                                                    |
| ----------- | ------------------------------------------------------------ |
| pacientes   | Armazena os dados pessoais dos pacientes e seus convênios.   |
| medicos     | Armazena os médicos, seus CRMs e especialidades.             |
| quartos     | Registra os quartos, andares, tipos e status de ocupação.    |
| internacoes | Armazena os dados das internações e valores das diárias.     |
| consultas   | Registra as consultas, pacientes, médicos e valores.         |
| prescricoes | Armazena os medicamentos, dosagens e quantidades receitadas. |

## 🔗 Relacionamentos

As tabelas estão relacionadas por meio de chaves primárias (PRIMARY KEY) e chaves estrangeiras (FOREIGN KEY).

- Um paciente pode possuir várias consultas.
- Um médico pode realizar várias consultas.
- Uma consulta pode possuir várias prescrições.
- Um paciente pode possuir várias internações.
- Um quarto pode estar relacionado a várias internações ao longo do tempo.

## 💻 Tecnologias utilizadas

- MySQL
- SQL
- MySQL Workbench
- GitHub

## 📚 Comandos SQL utilizados

Durante o desenvolvimento do projeto foram utilizados:

- CREATE DATABASE e CREATE TABLE
- INSERT INTO
- SELECT
- INNER JOIN
- LEFT JOIN
- WHERE
- LIKE
- BETWEEN
- ORDER BY
- GROUP BY
- DISTINCT
- AVG()
- SUM()
- COUNT()

## 📁 Organização do repositório

- `hospital_db_pacientes.sql` – criação e inserção dos dados de pacientes.
- `hospital_db_medicos.sql` – criação e inserção dos dados de médicos.
- `hospital_db_quartos.sql` – criação e inserção dos dados de quartos.
- `hospital_db_internacoes.sql` – criação e inserção dos dados de internações.
- `hospital_db_consultas.sql` – criação e inserção dos dados de consultas.
- `hospital_db_prescricoes.sql` – criação e inserção dos dados de prescrições.
- `diagrama.png` – diagrama entidade-relacionamento do banco de dados.
- script_hospital_db.sql – script de comandos sql do banco de dados.

## 🚀 Como executar o projeto

1. Instale o MySQL e abra o MySQL Workbench.
2. Crie ou selecione o banco de dados `hospital_db`.
3. Execute os scripts SQL na seguinte ordem:
   - Pacientes.
   - Médicos.
   - Quartos.
   - Consultas.
   - Internações.
   - Prescrições.
4. Após executar os scripts, utilize comandos SELECT para visualizar os registros e testar as consultas.

## 📊 Consultas estratégicas (DQL)

O projeto também contempla consultas SQL para atender às necessidades de diferentes setores hospitalares, como:

- Farmácia: consulta de medicamentos prescritos.
- Auditoria: histórico de internações.
- Recepção: pacientes, convênios e médicos.
- Coordenação médica: relatório de prescrições.
- Diretoria: cruzamento de dados de pacientes internados e consultados.
- Financeiro: análise de valores de consultas e diárias.
