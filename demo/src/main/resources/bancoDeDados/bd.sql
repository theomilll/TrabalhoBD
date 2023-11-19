CREATE DATABASE DBProjeto;
USE DBProjeto;

-- Tabelas de entidades básicas
CREATE TABLE IF NOT EXISTS Medicos (
    CRM VARCHAR(20) PRIMARY KEY,
    Nome VARCHAR(100),
    Especializacao VARCHAR(100),
    CEP VARCHAR(20),
    Rua VARCHAR(100),
    Cidade VARCHAR(100),
    Estado CHAR(2)
);

CREATE TABLE IF NOT EXISTS Pacientes (
    CPF VARCHAR(11) PRIMARY KEY,
    Nome VARCHAR(100),
    Rua VARCHAR(100),
    Cidade VARCHAR(100),
    Estado CHAR(2),
    CEP VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Funcionarios (
    Id_Funcionario INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Cargo VARCHAR(100),
    Departamento VARCHAR(100),
    Contato VARCHAR(50),
    Supervisor INT,
    Setor VARCHAR(100),
    Atividades_Atribuidas TEXT
);

CREATE TABLE IF NOT EXISTS Voluntarios (
    Id_Vol INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Relacionamento_com_NACC TEXT
);

CREATE TABLE IF NOT EXISTS Agenda (
    Id_Agenda INT PRIMARY KEY AUTO_INCREMENT,
    Data DATE,
    Notas TEXT
);

CREATE TABLE IF NOT EXISTS Eventos (
    Id_Evento INT PRIMARY KEY AUTO_INCREMENT,
    Categoria VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Atividades_do_NACC (
    Id_Atividade INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Descricao TEXT,
    Data DATE,
    Participantes TEXT,
    Materiais_Utilizados TEXT,
    Relatorio TEXT
);

CREATE TABLE IF NOT EXISTS Categorias_de_Doacoes (
    Id_Categoria INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Descricao TEXT,
    Subcategoria VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Transacoes_Financeiras (
    Id_Transacao INT PRIMARY KEY AUTO_INCREMENT,
    Valor DECIMAL(10,2),
    Id_Doador INT,
    Data DATE
);

CREATE TABLE IF NOT EXISTS Inventario_de_Materiais (
    Id_Inventario INT PRIMARY KEY AUTO_INCREMENT,
    Material VARCHAR(100),
    Quantidade INT
);

CREATE TABLE IF NOT EXISTS Setores_do_NACC (
    Id_Setor INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Responsavel VARCHAR(100),
    Relacionamento_com_Vol INT
);

-- Tabelas de relação (associativas)
CREATE TABLE IF NOT EXISTS Supervisiona (
    Medico_CRM VARCHAR(20),
    Supervisionado_CRM VARCHAR(20),
    PRIMARY KEY (Medico_CRM, Supervisionado_CRM),
    FOREIGN KEY (Medico_CRM) REFERENCES Medicos(CRM),
    FOREIGN KEY (Supervisionado_CRM) REFERENCES Medicos(CRM)
);

CREATE TABLE IF NOT EXISTS Atende (
    Medico_CRM VARCHAR(20),
    Paciente_CPF VARCHAR(11),
    PRIMARY KEY (Medico_CRM, Paciente_CPF),
    FOREIGN KEY (Medico_CRM) REFERENCES Medicos(CRM),
    FOREIGN KEY (Paciente_CPF) REFERENCES Pacientes(CPF)
);

CREATE TABLE IF NOT EXISTS Agendamento (
    Id_Agenda INT,
    Id_Atividade INT,
    PRIMARY KEY (Id_Agenda, Id_Atividade),
    FOREIGN KEY (Id_Agenda) REFERENCES Agenda(Id_Agenda),
    FOREIGN KEY (Id_Atividade) REFERENCES Atividades_do_NACC(Id_Atividade)
);

CREATE TABLE IF NOT EXISTS Atribuicao_de_Setor (
    Id_Setor INT,
    Id_Funcionario INT,
    PRIMARY KEY (Id_Setor, Id_Funcionario),
    FOREIGN KEY (Id_Setor) REFERENCES Setores_do_NACC(Id_Setor),
    FOREIGN KEY (Id_Funcionario) REFERENCES Funcionarios(Id_Funcionario)
);

CREATE TABLE IF NOT EXISTS Associacao_de_Voluntar (
    Id_Vol INT,
    Id_Setor INT,
    PRIMARY KEY (Id_Vol, Id_Setor),
    FOREIGN KEY (Id_Vol) REFERENCES Voluntarios(Id_Vol),
    FOREIGN KEY (Id_Setor) REFERENCES Setores_do_NACC(Id_Setor)
);

CREATE TABLE IF NOT EXISTS Doacao_Transacoes_Fin (
    Id_Transacao INT,
    Id_Categoria INT,
    PRIMARY KEY (Id_Transacao, Id_Categoria),
    FOREIGN KEY (Id_Transacao) REFERENCES Transacoes_Financeiras(Id_Transacao),
    FOREIGN KEY (Id_Categoria) REFERENCES Categorias_de_Doacoes(Id_Categoria)
);

CREATE TABLE IF NOT EXISTS Doacao_Transacoes_Fin (
    Id_Transacao INT,
    Id_Categoria INT,
    PRIMARY KEY (Id_Transacao, Id_Categoria),
    FOREIGN KEY (Id_Transacao) REFERENCES Transacoes_Financeiras(Id_Transacao),
    FOREIGN KEY (Id_Categoria) REFERENCES Categorias_de_Doacoes(Id_Categoria)
);
