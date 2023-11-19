public class PacienteService {
    private PacienteDAO pacienteDAO;

    public PacienteService(PacienteDAO pacienteDAO) {
        this.pacienteDAO = pacienteDAO;
    }

    public void registrarPaciente(Paciente paciente) {
        pacienteDAO.salvar(paciente);
    }

}
