package com.bdprojeto.myapp;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import lombok.Data;

@Entity
@Table(name = "Pacientes")
@Data
public class Paciente {

    @Id
    @NotNull
    @Size(min = 11, max = 11)
    private String cpf;

    @NotNull
    @Size(max = 100)
    private String nome;

    @Size(max = 200)
    private String rua;

    @Size(max = 10)
    private String cep;

    @Size(max = 100)
    private String cidade;

    @Size(max = 50)
    private String estado;
    
}
