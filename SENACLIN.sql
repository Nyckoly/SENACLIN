USE senaclin;

/* CRIAÇÃO DE ENTIDADES E ATRIBUTOS */
CREATE TABLE Paciente (
idPaciente INT AUTO_INCREMENT NOT NULL,
nome VARCHAR(50) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
tipoLogradouro VARCHAR(15) NOT NULL,
nomeLogradouro VARCHAR(30) NOT NULL,
numero VARCHAR(6) NOT NULL,
complemento VARCHAR(10) DEFAULT 'não existe',
telefone VARCHAR(11),
CONSTRAINT PRIMARY KEY (idPaciente),
CONSTRAINT ck_tipoLogradouro CHECK (tipoLogradouro='Rua' OR tipoLogradouro='Avenida' OR tipoLogradouro='Praça' OR tipoLogradouro='Estrada')
);

CREATE TABLE Dentista (
idDentista INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
cro CHAR(8) NOT NULL UNIQUE,
especialidade VARCHAR (14) DEFAULT 'Geral',
telefone VARCHAR(10),
celular VARCHAR(11),
CONSTRAINT ck_especialidade CHECK (especialidade='Ortodontia' OR especialidade='Geral' OR especialidade='Periodontia' OR especialidade='Implantodontia')
);

CREATE TABLE Consulta (
idConsulta INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
dataConsulta DATE NOT NULL ,
horaConsulta TIME NOT NULL,
tipoConsulta VARCHAR(10) NOT NULL,
idPaciente INT NOT NULL,
idDentista INT NOT NULL,
observacao VARCHAR(250),
CONSTRAINT CK_tipoConsulta CHECK (tipoConsulta='Avaliação' OR tipoConsulta='Tratamento'),
CONSTRAINT FK_Consulta_Paciente FOREIGN KEY (idPaciente) REFERENCES paciente (idPaciente),
CONSTRAINT FK_Consulta_Dentista FOREIGN KEY (idDentista) REFERENCES Dentista (idDentista)
);


/* EXERCÍCIO 1 */
ALTER TABLE `paciente`
ADD COLUMN `cidade` VARCHAR(80) NOT NULL;

/* EXERCÍCIO 2 */
INSERT INTO paciente
VALUES (1, 'Sophia', '81824923864', 'Rua', 'Doutor Marcos Vendramini', '835', NULL, '13997973328', 'Santos');

INSERT INTO paciente
VALUES (2, 'Ruan', '90212239880', 'Rua', 'Fausto Lourenço Gomes', '703', NULL, '13988228686', 'Santos');

INSERT INTO paciente
VALUES (3, 'Diego', '40007429819', 'Avenida', 'São Francisco', '974', NULL, '13995440299', 'Santos');

INSERT INTO paciente
VALUES (4, 'Isis', '46337535847', 'Rua', 'Um C', '980', NULL, '13983534499', 'Guarujá');

INSERT INTO paciente
VALUES (5, 'Andreia', '21199989819', 'Rua', 'Professor Celestino Bourrul', '265', NULL, '13999172941', 'São Vicente');

INSERT INTO paciente
VALUES (6, 'Marcos', '04065211824', 'Rua', 'Mário Augusto dos Santos Lopes', '347', NULL, '13988781045', 'São Vicente');

/* EXERCÍCIO 3 */

INSERT INTO dentista (nome, cro, especialidade, celular)
VALUES ('Nicole', '111111SP', 'Ortodontia', '11989391713');

INSERT INTO dentista (nome, cro, especialidade, celular)
VALUES ('Anderson', '222222SP', 'Geral', '11999712589');

INSERT INTO dentista (nome, cro, especialidade, celular)
VALUES ('Laís', '333333SP', 'Periodontia', '11983893652');

INSERT INTO dentista (nome, cro, especialidade, celular)
VALUES ('Débora', '444444SP', 'Implantodontia', '11994717607');