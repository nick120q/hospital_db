CREATE DATABASE IF NOT EXISTS hospital_db;

USE hospital_db;

CREATE TABLE IF NOT EXISTS pacientes(
	id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nome_paciente VARCHAR(255) NOT NULL,
    cpf VARCHAR(255) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    telefone_paciente VARCHAR(15) NOT NULL,
    convenio VARCHAR(50) NOT NULL
);		

CREATE TABLE IF NOT EXISTS medicos (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nome_medico VARCHAR(100) NOT NULL,
    crm VARCHAR(20) NOT NULL,
    especialidade VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS quartos (
    id_quarto INT AUTO_INCREMENT PRIMARY KEY,
    numero_quarto INT NOT NULL,
    andar INT NOT NULL,
    tipo_quarto VARCHAR(50) NOT NULL,
    status_quarto VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS internacoes (
    id_internacao INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_quarto INT NOT NULL,
    data_entrada DATE NOT NULL,
    data_saida DATE,
    valor_diaria DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
    FOREIGN KEY (id_quarto) REFERENCES quartos(id_quarto)
);

CREATE TABLE IF NOT EXISTS consultas (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    data_consulta DATETIME NOT NULL,
    status_consulta VARCHAR(30) NOT NULL,
    valor_consulta DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES medicos(id_medico)
);

CREATE TABLE IF NOT EXISTS prescricoes (
    id_prescricao INT AUTO_INCREMENT PRIMARY KEY,
    id_consulta INT NOT NULL,
    medicamento VARCHAR(100) NOT NULL,
    dosagem VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (id_consulta) REFERENCES consultas(id_consulta)
);

-- Insercao em Pacientes
INSERT INTO pacientes (nome_paciente, cpf, data_nascimento, telefone_paciente, convenio) VALUES
('Ana Silva', '111.222.333-01', '1985-03-15', '(11) 98765-4321', 'Unimed'),
('Carlos Oliveira', '222.333.444-02', '1990-07-22', '(11) 97654-3210', 'Bradesco Saúde'),
('Maria Santos', '333.444.555-03', '1978-11-05', '(11) 96543-2109', 'Unimed'),
('João Pedro Silva', '444.555.666-04', '2000-01-30', '(11) 95432-1098', 'Particular'),
('Fernanda Costa', '555.666.777-05', '1995-09-12', '(11) 94321-0987', 'Amil'),
('Roberto Almeida', '666.777.888-06', '1962-04-18', '(11) 93210-9876', 'SulAmérica'),
('Juliana Oliveira', '777.888.999-07', '1988-12-08', '(11) 92109-8765', 'Unimed Pleno'),
('Lucas Souza', '888.999.000-08', '2003-05-25', '(11) 91098-7654', 'Particular'),
('Beatriz Lima', '999.000.111-09', '1973-08-02', '(11) 90987-6543', 'Bradesco Saúde'),
('Ricardo Pereira', '000.111.222-10', '1981-10-19', '(11) 98877-6655', 'Amil');

-- Insercao em Médicos
INSERT INTO medicos (nome_medico, crm, especialidade) VALUES
('Dr. Marcos Andrade', 'CRM/SP 12345', 'Cardiologia'),
('Dra. Patricia Lima', 'CRM/SP 23456', 'Pediatria'),
('Dr. Roberto Silva', 'CRM/SP 34567', 'Cardiologia Pediatrica'),
('Dra. Camila Rocha', 'CRM/SP 45678', 'Cirurgia Geral'),
('Dr. Gustavo Santos', 'CRM/SP 56789', 'Ortopedia'),
('Dra. Vanessa Martins', 'CRM/SP 67890', 'Cirurgia Vascular'),
('Dr. Felipe Barbosa', 'CRM/SP 78901', 'Neurologia'),
('Dra. Renata Mello', 'CRM/SP 89012', 'Ginecologia'),
('Dr. Eduardo Ramos', 'CRM/SP 90123', 'Dermatologia'),
('Dra. Claudia Castro', 'CRM/SP 01234', 'Cirurgia Plastica');

-- Insercao em Quartos
INSERT INTO quartos (numero_quarto, andar, tipo_quarto, status_quarto) VALUES
(101, 1, 'UTI', 'Ocupado'),
(102, 1, 'Enfermaria', 'Livre'),
(201, 2, 'Apartamento', 'Ocupado'),
(202, 2, 'Apartamento', 'Livre'),
(301, 3, 'UTI', 'Ocupado'),
(302, 3, 'Enfermaria', 'Ocupado'),
(401, 4, 'Suíte VIP', 'Livre'),
(402, 4, 'Apartamento', 'Ocupado'),
(501, 5, 'UTI', 'Livre'),
(502, 5, 'Enfermaria', 'Ocupado');

-- Insercao em Internações
INSERT INTO internacoes (id_paciente, id_quarto, data_entrada, data_saida, valor_diaria) VALUES
(1, 1, '2026-02-10', '2026-02-20', 450.00),
(2, 3, '2026-03-01', '2026-03-10', 300.00),
(3, 5, '2026-04-15', '2026-04-25', 500.00),
(7, 6, '2026-05-01', '2026-05-08', 250.00),
(5, 8, '2026-06-10', '2026-06-18', 350.00),
(6, 10, '2026-07-01', '2026-07-10', 280.00),
(2, 1, '2026-08-05', '2026-08-12', 450.00),
(4, 2, '2026-01-15', '2026-01-22', 200.00),
(8, 4, '2026-02-20', '2026-02-28', 320.00),
(9, 7, '2026-03-12', '2026-03-19', 600.00);

-- Insercao em Consultas
INSERT INTO consultas (id_paciente, id_medico, data_consulta, status_consulta, valor_consulta) VALUES
(1, 1, '2026-01-10 09:00:00', 'Realizada', 350.00),
(1, 4, '2026-02-05 14:00:00', 'Realizada', 500.00),
(2, 3, '2026-03-01 10:30:00', 'Realizada', 400.00),
(3, 2, '2026-03-15 11:00:00', 'Realizada', 280.00),
(4, 6, '2026-04-10 15:00:00', 'Realizada', 550.00),
(5, 5, '2026-05-02 08:30:00', 'Realizada', 320.00),
(6, 1, '2026-05-20 16:00:00', 'Realizada', 350.00),
(7, 10, '2026-06-01 13:00:00', 'Realizada', 600.00),
(8, 8, '2026-06-15 10:00:00', 'Realizada', 300.00),
(1, 4, '2026-07-01 14:00:00', 'Realizada', 500.00);

-- Insercao em Prescrições
INSERT INTO prescricoes (id_consulta, medicamento, dosagem, quantidade) VALUES
(1, 'Dipirona 500mg', '1 comprimido de 6h/6h', 20),
(1, 'Amoxicilina 500mg', '1 capsula de 8h/8h', 21),
(2, 'Ibuprofeno 600mg', '1 comprimido de 12h/12h', 10),
(3, 'Paracetamol 750mg', '1 comprimido de 8h/8h', 15),
(4, 'Omeprazol 20mg', '1 capsula em jejum', 30),
(5, 'Cetanest', 'Aplicar via IV', 5),
(6, 'Dorflex', '1 comprimido se dor', 12),
(7, 'Atenolol 50mg', '1 comprimido ao dia', 30),
(8, 'Cefalexina 500mg', '1 capsula de 6h/6h', 28),
(10, 'Tramadol 50mg', '1 comprimido de 8h/8h', 10);

-- Pacientes, médicos e medicamentos
SELECT p.nome_paciente, m.nome_medico,
       c.data_consulta, pr.medicamento, pr.quantidade
FROM pacientes p
INNER JOIN consultas c ON p.id_paciente = c.id_paciente
INNER JOIN medicos m ON c.id_medico = m.id_medico
INNER JOIN prescricoes pr ON c.id_consulta = pr.id_consulta;

-- Histórico de internações
SELECT p.nome_paciente, q.numero_quarto,
       q.andar, i.data_entrada, i.valor_diaria
FROM internacoes i
INNER JOIN pacientes p ON i.id_paciente = p.id_paciente
INNER JOIN quartos q ON i.id_quarto = q.id_quarto;

-- Pacientes, convênios e médicos
SELECT p.nome_paciente, p.convenio,
       m.nome_medico, m.especialidade
FROM pacientes p
LEFT JOIN consultas c ON p.id_paciente = c.id_paciente
LEFT JOIN medicos m ON c.id_medico = m.id_medico;

-- Prescrições médicas
SELECT m.nome_medico, m.especialidade,
       p.nome_paciente, pr.medicamento
FROM prescricoes pr
INNER JOIN consultas c ON pr.id_consulta = c.id_consulta
INNER JOIN medicos m ON c.id_medico = m.id_medico
INNER JOIN pacientes p ON c.id_paciente = p.id_paciente;

-- Pacientes internados que também fizeram consultas
SELECT DISTINCT p.nome_paciente, q.numero_quarto,
       m.nome_medico, c.data_consulta
FROM pacientes p
INNER JOIN internacoes i ON p.id_paciente = i.id_paciente
INNER JOIN quartos q ON i.id_quarto = q.id_quarto
INNER JOIN consultas c ON p.id_paciente = c.id_paciente
INNER JOIN medicos m ON c.id_medico = m.id_medico;

-- Consultas mais recentes
SELECT p.nome_paciente, m.nome_medico, c.data_consulta
FROM consultas c
INNER JOIN pacientes p ON c.id_paciente = p.id_paciente
INNER JOIN medicos m ON c.id_medico = m.id_medico
ORDER BY c.data_consulta DESC;

-- Valores das diárias
SELECT p.nome_paciente, q.numero_quarto, i.valor_diaria
FROM internacoes i
INNER JOIN pacientes p ON i.id_paciente = p.id_paciente
INNER JOIN quartos q ON i.id_quarto = q.id_quarto
ORDER BY i.valor_diaria ASC;

-- Média dos valores das consultas
SELECT AVG(valor_consulta) AS media_consultas
FROM consultas;

-- Total arrecadado com consultas
SELECT SUM(valor_consulta) AS total_arrecadado
FROM consultas
WHERE status_consulta = 'Realizada';

