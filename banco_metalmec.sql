CREATE DATABASE IF NOT EXISTS bd_metalmec_operacao;

USE bd_metalmec_operacao;

CREATE TABLE setores (
	id_setores INT PRIMARY KEY,
    codigo_setores VARCHAR (24) NOT NULL,
    nome_setores VARCHAR (85) NOT NULL,
    descricao_setores VARCHAR (100) NOT NULL,
    data_registro_setores DATE NOT NULL,
    ativo_setores BOOLEAN NOT NULL DEFAULT TRUE,
    valor_setores DECIMAL (8,2) NOT NULL
);

CREATE TABLE operadores (
	id_operadores INT PRIMARY KEY,
    codigo_operadores VARCHAR (24) NOT NULL,
    nome_operadores VARCHAR (85) NOT NULL,
    descricao_operadores VARCHAR (100) NOT NULL,
    data_registro_operadores DATE NOT NULL,
    ativo_operadores BOOLEAN NOT NULL DEFAULT TRUE,
    valor_operadores DECIMAL (8,2) NOT NULL,
    id_setores INT NOT NULL,
    FOREIGN KEY (id_setores)
    REFERENCES setores(id_setores)
);

CREATE TABLE maquinas (
	id_maquinas INT PRIMARY KEY,
    codigo_maquinas VARCHAR (24) NOT NULL,
    nome_maquinas VARCHAR (85) NOT NULL,
    descricao_maquinas VARCHAR (100) NOT NULL,
    data_registro_maquinas DATE NOT NULL,
    ativo_maquinas BOOLEAN NOT NULL DEFAULT TRUE,
    valor_maquinas DECIMAL (8,2) NOT NULL,
    id_setores INT NOT NULL,
    FOREIGN KEY (id_setores)
    REFERENCES setores(id_setores)
);

CREATE TABLE ferramentas (
	id_ferramentas INT PRIMARY KEY,
    codigo_ferramentas VARCHAR (24) NOT NULL,
    nome_ferramentas VARCHAR (85) NOT NULL,
    descricao_ferramentas VARCHAR (100) NOT NULL,
    data_registro_ferramentas DATE NOT NULL,
    ativo_ferramentas BOOLEAN NOT NULL DEFAULT TRUE,
    valor_ferramentas DECIMAL (8,2) NOT NULL,
    id_maquinas INT NOT NULL,
    FOREIGN KEY (id_maquinas)
    REFERENCES maquinas(id_maquinas)
);

INSERT INTO setores
(id_setores,codigo_setores,nome_setores,descricao_setores,data_registro_setores,ativo_setores,valor_setores)

VALUES
(1,'SET-001','Setor de usinagem','Registro operacional 01 de setores','2026-01-01',1,52.75),
(2,'SET-002','Setor de montagem','Registro operacional 02 de setores','2026-02-02',1,70.00),
(3,'SET-003','Setor de testes','Registro operacional 03 de setores','2026-03-03',1,87.25),
(4,'SET-004','Setor de embalagem','Registro operacional 04 de setores','2026-04-04',1,104.50),
(5,'SET-005','Setor de corte','Registro operacional 05 de setores','2026-05-05',0,121.75),
(6,'SET-006','Setor de soldagem','Registro operacional 06 de setores','2026-06-06',1,139.00),
(7,'SET-007','Setor de pintura','Registro operacional 07 de setores','2026-07-07',1,156.25),
(8,'SET-008','Setor de manunteção','Registro operacional 08 de setores','2026-08-08',1,173.5),
(9,'SET-009','Setor de inspeção','Registro operacional 09 de setores','2026-09-09',1,190.75),
(10,'SET-010','Setor de expedição','Registro operacional 10 de setores','2026-01-10',1,208.00);

INSERT INTO operadores
(id_operadores, codigo_operadores, nome_operadores, descricao_operadores,
 data_registro_operadores, ativo_operadores, valor_operadores, id_setores)
 
 VALUES
(1, 'OPE-001', 'Operador CNC', 'Registro operacional 01 de operadores', '2026-01-01', 1, 52.75, 1),
(2, 'OPE-002', 'Operador de prensa', 'Registro operacional 02 de operadores', '2026-02-02', 1, 70.00, 2),
(3, 'OPE-003', 'Operador de montagem', 'Registro operacional 03 de operadores', '2026-03-03', 1, 87.25, 3),
(4, 'OPE-004', 'Operador de corte', 'Registro operacional 04 de operadores', '2026-04-04', 1, 104.50, 4),
(5, 'OPE-005', 'Operador de solda', 'Registro operacional 05 de operadores', '2026-05-05', 0, 121.75, 5),
(6, 'OPE-006', 'Operador de inspeção', 'Registro operacional 06 de operadores', '2026-06-06', 1, 139.00, 6),
(7, 'OPE-007', 'Operador de chapa', 'Registro operacional 07 de operadores', '2026-07-07', 1, 156.25, 7),
(8, 'OPE-008', 'Operador de torno', 'Registro operacional 08 de operadores', '2026-08-08', 1, 173.50, 8),
(9, 'OPE-009', 'Operador de fresadora', 'Registro operacional 09 de operadores', '2026-09-09', 1, 190.75, 9),
(10, 'OPE-010', 'Operador de logística', 'Registro operacional 10 de operadores', '2026-01-10', 0, 208.00, 10);


INSERT INTO maquinas
(id_maquinas, codigo_maquinas, nome_maquinas, descricao_maquinas,
 data_registro_maquinas, ativo_maquinas, valor_maquinas, id_setores)
 
 VALUES
 (1, 'MAQ-001', 'Torno CNC', 'Registro operacional 01 de maquinas', '2026-01-01', 1, 52.75, 1),
(2, 'MAQ-002', 'Prensa hidráulica', 'Registro operacional 02 de maquinas', '2026-02-02', 1, 70.00, 2),
(3, 'MAQ-003', 'Esteira transportadora', 'Registro operacional 03 de maquinas', '2026-03-03', 1, 87.25, 3),
(4, 'MAQ-004', 'Fresadora CNC', 'Registro operacional 04 de maquinas', '2026-04-04', 1, 104.50, 4),
(5, 'MAQ-005', 'Robô de soldagem', 'Registro operacional 05 de maquinas', '2026-05-05', 0, 121.75, 5),
(6, 'MAQ-006', 'Célula de montagem', 'Registro operacional 06 de maquinas', '2026-06-06', 1, 139.00, 6),
(7, 'MAQ-007', 'Máquina de corte', 'Registro operacional 07 de maquinas', '2026-07-07', 1, 156.25, 7),
(8, 'MAQ-008', 'Injetora industrial', 'Registro operacional 08 de maquinas', '2026-08-08', 1, 173.50, 8),
(9, 'MAQ-009', 'Centro de usinagem', 'Registro operacional 09 de maquinas', '2026-09-09', 1, 190.75, 9),
(10, 'MAQ-010', 'Forno de tratamento', 'Registro operacional 10 de maquinas', '2026-01-10', 0, 208.00, 10);


INSERT INTO ferramentas
(id_ferramentas, codigo_ferramentas, nome_ferramentas, descricao_ferramentas,
 data_registro_ferramentas, ativo_ferramentas, valor_ferramentas, id_maquinas)
 
 VALUES
 
 (1, 'FER-001', 'Paquímetro digital', 'Registro operacional 01 de ferramentas', '2026-01-01', 1, 52.75, 1),
(2, 'FER-002', 'Broca de precisão', 'Registro operacional 02 de ferramentas', '2026-02-02', 1, 70.00, 2),
(3, 'FER-003', 'Fresa de topo', 'Registro operacional 03 de ferramentas', '2026-03-03', 1, 87.25, 3),
(4, 'FER-004', 'Torquímetro', 'Registro operacional 04 de ferramentas', '2026-04-04', 1, 104.50, 4),
(5, 'FER-005', 'Chave pneumática', 'Registro operacional 05 de ferramentas', '2026-05-05', 0, 121.75, 5),
(6, 'FER-006', 'Disco de corte', 'Registro operacional 06 de ferramentas', '2026-06-06', 1, 139.00, 6),
(7, 'FER-007', 'Micrômetro', 'Registro operacional 07 de ferramentas', '2026-07-07', 1, 156.25, 7),
(8, 'FER-008', 'Mandril industrial', 'Registro operacional 08 de ferramentas', '2026-08-08', 1, 173.50, 8),
(9, 'FER-009', 'Calibrador', 'Registro operacional 09 de ferramentas', '2026-09-09', 1, 190.75, 9),
(10, 'FER-010', 'Lâmina de corte', 'Registro operacional 10 de ferramentas', '2026-01-10', 0, 208.00, 10);