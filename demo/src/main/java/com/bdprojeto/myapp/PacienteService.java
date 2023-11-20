package com.bdprojeto.myapp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PacienteService {
    private final PacienteDAO pacienteDAO;

    @Autowired
    public PacienteService(PacienteDAO pacienteDAO) {
        this.pacienteDAO = pacienteDAO;
    }

    public void registrarPaciente(Paciente paciente) {
        pacienteDAO.save(paciente);
    }

}
