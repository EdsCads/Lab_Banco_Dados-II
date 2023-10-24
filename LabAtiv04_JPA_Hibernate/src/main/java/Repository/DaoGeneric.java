package Repository;

/*
* @author Cadilhe
*/
import javax.persistence.EntityManager;
import java.util.Objects;

class DaoGeneric<T extends EntidadeBase> {

    private final EntityManager manager;

    DAOGenerico(EntityManager manager) {
        this.manager = manager;
    }

    T buscaPorId(Class<T> clazz, Integer id) {
        return manager.find(clazz, id);

    }

    T salvaOuAtualiza(T t) {
        // log, processamento adicional
        if( Objects.isNull(t.getId()) )
             this.manager.persist(t);
        else
            t = this.manager.merge(t);

        return t;


    }

    void remove(T t) {
        manager.remove(t);
        manager.flush();
    }
}
