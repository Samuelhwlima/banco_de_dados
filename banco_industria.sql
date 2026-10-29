-- Criação do Banco de Dados
DROP DATABASE IF EXISTS bd_gestao_ativos_industriais;
CREATE DATABASE bd_gestao_ativos_industriais;
USE bd_gestao_ativos_industriais;

-- Tabela setores
CREATE TABLE IF NOT EXISTS setores (
    id_setor INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(12) NOT NULL UNIQUE,
    nome VARCHAR(70) NOT NULL,
    bloco VARCHAR(30) NOT NULL,
    ramal VARCHAR(10),
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

-- Tabela tecnicos
CREATE TABLE IF NOT EXISTS tecnicos (
    id_tecnico INT AUTO_INCREMENT PRIMARY KEY,
    matricula VARCHAR(12) NOT NULL UNIQUE,
    nome VARCHAR(80) NOT NULL,
    especialidade VARCHAR(50) NOT NULL,
    telefone VARCHAR(16),
    id_setor INT NOT NULL,
    disponivel BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT fk_tecnicos_id_setor
    FOREIGN KEY (id_setor)
    REFERENCES setores(id_setor)
);

-- Tabela equipamentos
CREATE TABLE IF NOT EXISTS equipamentos (
    id_equipamento INT AUTO_INCREMENT PRIMARY KEY,
    patrimonio VARCHAR(16) NOT NULL UNIQUE,
    descricao VARCHAR(90) NOT NULL,
    categoria VARCHAR(40) NOT NULL,
    id_setor INT NOT NULL,
    data_aquisicao DATE NOT NULL,
    custo DECIMAL(10,2) NOT NULL,
    situacao VARCHAR(25) NOT NULL DEFAULT 'Operacional',
    CONSTRAINT fk_equipamentos_id_setor
    FOREIGN KEY (id_setor)
    REFERENCES setores(id_setor)
);

-- Tabela ordens_servico
CREATE TABLE IF NOT EXISTS ordens_servico (
    id_os INT AUTO_INCREMENT PRIMARY KEY,
    codigo_os VARCHAR(16) NOT NULL UNIQUE,
    id_equipamento INT NOT NULL,
    id_tecnico INT NOT NULL,
    descricao VARCHAR(120) NOT NULL,
    prioridade VARCHAR(15) NOT NULL,
    status_os VARCHAR(20) NOT NULL DEFAULT 'Aberta',
    data_abertura DATE NOT NULL,
    CONSTRAINT fk_ordens_servico_id_equipamento
    FOREIGN KEY (id_equipamento)
    REFERENCES equipamentos(id_equipamento),
    CONSTRAINT fk_ordens_servico_id_tecnico
    FOREIGN KEY (id_tecnico)
    REFERENCES tecnicos(id_tecnico)
);

-- Tabela intervencoes
CREATE TABLE IF NOT EXISTS intervencoes (
    id_intervencao INT AUTO_INCREMENT PRIMARY KEY,
    id_os INT NOT NULL,
    id_tecnico INT NOT NULL,
    data_intervencao DATE NOT NULL,
    procedimento VARCHAR(130) NOT NULL,
    horas DECIMAL(5,2) NOT NULL,
    concluida BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT fk_intervencoes_id_os
    FOREIGN KEY (id_os)
    REFERENCES ordens_servico(id_os),
    CONSTRAINT fk_intervencoes_id_tecnico
    FOREIGN KEY (id_tecnico)
    REFERENCES tecnicos(id_tecnico)
);

-- 10 registros iniciais: setores
INSERT INTO setores (codigo, nome, bloco, ramal) VALUES
('ST-01', 'Usinagem', 'B2', '310'), -- atualizando o ramal, a pedido da atividade 6
('ST-02', 'Montagem', 'B3', '212'),
('ST-03', 'Automacao', 'B1', '213'),
('ST-04', 'Qualidade', 'B2', '214'),
('ST-05', 'Manutencao', 'B3', '215'),
('ST-06', 'TI Industrial', 'B1', '216'),
('ST-07', 'Logistica', 'B2', '217'),
('ST-08', 'Energia', 'B3', '218'),
('ST-09', 'Metrologia', 'B1', '219'),
('ST-10', 'Engenharia', 'B2', '220'),
('ST-11', 'Prototipagem', 'B4', '221'), -- atividade 1
('ST-12', 'Robotica', 'B4', '222'), -- atividade 2
('ST-13', 'Laboratorio IoT', 'B5', '223'); -- atividade 2

-- 10 registros iniciais: tecnicos
INSERT INTO tecnicos (matricula, nome, especialidade, telefone, id_setor) VALUES
('TC-001', 'Ana Ribeiro', 'Eletrica', '45990000001', 1),
('TC-002', 'Bruno Lima', 'Automacao Industrial', '45991112222', 2), -- atualizando dados a pedido da atividade 7
('TC-003', 'Carla Nunes', 'Redes', '45990000003', 3),
('TC-004', 'Diego Alves', 'Software', '45990000004', 4),
('TC-005', 'Elisa Martins', 'Mecanica', '45990000005', 5),
('TC-006', 'Fabio Costa', 'Eletrica', '45990000006', 6),
('TC-007', 'Gabriela Rocha', 'Automacao', '45990000007', 7),
('TC-008', 'Henrique Souza', 'Redes', '45990000008', 8),
('TC-009', 'Isabela Pinto', 'Software', '45990000009', 9),
('TC-010', 'Joao Vieira', 'Mecanica', '45990000010', 10),
('TC-011', 'Lucas Ferreira', 'Instrumentacao', '45990000111', 11); -- atividade 3

-- 10 registros iniciais: equipamentos
INSERT INTO equipamentos (patrimonio, descricao, categoria, id_setor, data_aquisicao, custo) VALUES
('AT-001', 'Torno CNC', 'Mecanico', 1, '2025-02-15', 3175.5),
('AT-002', 'Esteira modular', 'Transporte', 2, '2025-03-15', 3851.0),
('AT-003', 'CLP industrial', 'Automacao', 3, '2025-04-15', 4526.5),
('AT-004', 'Bancada de ensaios', 'Teste', 4, '2025-05-15', 5202.0),
('AT-005', 'Prensa hidraulica', 'Hidraulico', 5, '2025-06-15', 5877.5),
('AT-006', 'Servidor SCADA', 'Servidor', 6, '2025-07-15', 6553.0),
('AT-007', 'Leitor RFID', 'Identificacao', 7, '2025-08-15', 7228.5),
('AT-008', 'Inversor de frequencia', 'Eletrico', 8, '2025-09-15', 7904.0),
('AT-009', 'Calibrador digital', 'Medicao', 9, '2025-01-15', 8579.5),
('AT-010', 'Estacao CAD', 'Computador', 10, '2025-02-15', 9255.0),
('AT-011', 'Impressora 3D industrial', 'Prototipagem', 11, '2026-10-01', 18500.00), -- atividade 4
('AT-012', 'Gateway IoT', 'Redes', 13, '2026-10-02', 3900.00); -- atividade 4

INSERT INTO equipamentos (patrimonio, descricao, categoria, id_setor, data_aquisicao, custo) 
VALUES ('AT-013', 'Roteador industrial reserva', 'Redes', 6, '2026-10-10', 2100.00);

UPDATE equipamentos
SET situacao = 'Reserva', id_setor = 10
WHERE id_equipamento = 13;

DELETE FROM equipamentos
WHERE id_equipamento = 13; -- Atividade 15

UPDATE equipamentos
SET id_setor = 6
WHERE id_equipamento = 12; -- atividade 12

UPDATE equipamentos
SET custo = custo + 250.00
WHERE id_equipamento IN (2, 5)
  AND custo BETWEEN 3000.00 AND 7000.00;

-- 10 registros iniciais: ordens_servico
INSERT INTO ordens_servico (codigo_os, id_equipamento, id_tecnico, descricao, prioridade, status_os, data_abertura) VALUES
('OS-2026-001', 1, 1, 'Inspecao preventiva de torno cnc', 'Alta', 'Em andamento', '2026-09-01'), -- atividade 8 - linha 1
('OS-2026-002', 2, 2, 'Inspecao preventiva de esteira modular', 'Alta', 'Concluida', '2026-09-02'),
('OS-2026-003', 3, 3, 'Inspecao preventiva de clp industrial', 'Baixa', 'Aberta', '2026-09-03'),
('OS-2026-004', 4, 4, 'Inspecao preventiva de bancada de ensaios', 'Alta', 'Em andamento', '2026-09-04'), -- atividade 8 - linha 2
('OS-2026-005', 5, 5, 'Inspecao preventiva de prensa hidraulica', 'Alta', 'Concluida', '2026-09-05'),
('OS-2026-006', 6, 6, 'Inspecao preventiva de servidor scada', 'Baixa', 'Aberta', '2026-09-06'),
('OS-2026-007', 7, 7, 'Inspecao preventiva de leitor rfid', 'Alta', 'Em andamento', '2026-09-07'), -- atividade 8 - linha 3
('OS-2026-008', 8, 8, 'Inspecao preventiva de inversor de frequencia', 'Alta', 'Concluida', '2026-09-08'),
('OS-2026-009', 9, 9, 'Inspecao preventiva de calibrador digital', 'Baixa', 'Aberta', '2026-09-09'),
('OS-2026-010', 10, 10, 'Inspecao preventiva de estacao cad', 'Alta', 'Em andamento', '2026-09-10'), -- atividade 8 - linha 4
('OS-2026-011', 11, 11, 'Calibracao inicial da impressora 3D', 'Alta', 'Aberta', '2026-10-03'); -- primeira parte atividade 5

INSERT INTO ordens_servico (codigo_os, id_equipamento, id_tecnico, descricao, prioridade, status_os, data_abertura) 
VALUES ('OS-2026-012', 12, 11, 'Teste administrativo sem atendimento', 'Baixa', 'Aberta', '2026-10-05');

DELETE FROM ordens_servico
WHERE id_os = 12 
AND prioridade = 'Baixa'; -- atividade 13	

DELETE FROM ordens_servico
WHERE id_os = 11;-- atividade 14
  
UPDATE equipamentos
SET situacao = 'Em avaliação'
WHERE id_equipamento = 11; -- terceiro update da atividade 10

UPDATE ordens_servico
SET status_os = 'Concluida'
WHERE id_os = 11; -- Primeiro Update da atividade 10

-- 10 registros iniciais: intervencoes
INSERT INTO intervencoes (id_os, id_tecnico, data_intervencao, procedimento, horas, concluida) VALUES
(1, 1, '2026-09-11', 'Verificacao tecnica e registro da OS 001', 0.75, FALSE),
(2, 2, '2026-09-12', 'Verificacao tecnica e registro da OS 002', 1.0, FALSE),
(3, 3, '2026-09-13', 'Verificacao tecnica e registro da OS 003', 1.25, TRUE),
(4, 4, '2026-09-14', 'Verificacao tecnica e registro da OS 004', 1.5, FALSE),
(5, 5, '2026-09-15', 'Verificacao tecnica e registro da OS 005', 1.75, FALSE),
(6, 6, '2026-09-16', 'Verificacao tecnica e registro da OS 006', 2.0, TRUE),
(7, 7, '2026-09-17', 'Verificacao tecnica e registro da OS 007', 2.25, FALSE),
(8, 8, '2026-09-18', 'Verificacao tecnica e registro da OS 008', 2.5, FALSE),
(9, 9, '2026-09-19', 'Verificacao tecnica e registro da OS 009', 2.75, TRUE),
(10, 10, '2026-09-20', 'Verificacao tecnica e registro da OS 010', 3.0, FALSE),
(11, 11, '2026-10-04', 'Diagnostico e ajuste de extrusor', 1.50, FALSE); -- segunda parte atividade 5

DELETE FROM intervencoes
WHERE id_intervencao = 11; -- atividade 14

UPDATE intervencoes
SET concluida = TRUE
WHERE id_intervencao = 11; -- Segundo update da 10

DELETE FROM setores
WHERE id_setor = 13; -- atividade 12

DELETE FROM setores
WHERE id_setor = 12; -- atividade 11