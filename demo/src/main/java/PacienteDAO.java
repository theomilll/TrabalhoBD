import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PacienteDAO {
    private static final Logger logger = LoggerFactory.getLogger(PacienteDAO.class);
    private SessionFactory sessionFactory;

    public void salvar(Paciente paciente) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(paciente);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            logger.error("Erro ao salvar o paciente", e);
        }
    }

    public Paciente buscarPorId(String cpf) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Paciente.class, cpf);
        } catch (Exception e) {
            logger.error("Erro ao buscar o paciente pelo CPF", e);
            throw e;
        }
    }

    public void atualizar(Paciente paciente) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.update(paciente);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            logger.error("Erro ao atualizar o paciente", e);
            throw e;
        }
    }

    public void deletar(Paciente paciente) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.delete(paciente);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            logger.error("Erro ao deletar o paciente", e);
            throw e;
        }
    }
    public PacienteDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
