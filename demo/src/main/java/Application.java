import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Application {
    private static final Logger logger = LoggerFactory.getLogger(Application.class);
    private static final String STARTUP_ERROR_MSG = "Falha ao iniciar a aplicação.";
    private static final String REGISTRATION_SUCCESS_MSG = "Paciente registrado com sucesso.";
    private static final String INVALID_DATA_MSG = "Dados do paciente inválidos.";

    public static void main(String[] args) {
        PacienteService pacienteService = getService();
        
        try {
            iniciarAplicacao(pacienteService);
        } catch (Exception e) { 
            logger.error(STARTUP_ERROR_MSG, e);
        } finally {
            HibernateUtil.shutdown();
        }
    }

    private static PacienteService getService() {
        return new PacienteService(new PacienteDAO(HibernateUtil.getSessionFactory()));
    }
    

    private static void iniciarAplicacao(PacienteService pacienteService) {
        Paciente paciente = criarPacienteComDadosValidos();
        if (paciente != null) {
            pacienteService.registrarPaciente(paciente);
            logger.info(REGISTRATION_SUCCESS_MSG);
        } else {
            logger.warn(INVALID_DATA_MSG);
        }
    }

    private static Paciente criarPacienteComDadosValidos() {
        Paciente paciente = new Paciente();
        paciente.setCpf("16671332762");
        paciente.setNome("Joao");
        // Set other properties as required
        // Add actual validation logic
        return paciente;
    }
    
}