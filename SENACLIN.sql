USE senaclin;

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