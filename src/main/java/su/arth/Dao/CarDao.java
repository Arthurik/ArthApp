package su.arth.Dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import su.arth.Domen.Car;

import java.util.List;

/**
 * Created by arthur on 16.04.15.
 */
@Repository
public class CarDao {

@Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public void addCar(Car car){

        sessionFactory.getCurrentSession().save(car);

    }

    @SuppressWarnings("unchecked")
    public List<Car> listCar() {

        return sessionFactory.getCurrentSession().createQuery("from Car ")
                .list();
    }


    @SuppressWarnings("unchecked")
    public Car findByVin(String vincode){
        return (Car) sessionFactory.getCurrentSession().createQuery("from Car where vincode=: vincode").setParameter("vincode",vincode).list().get(0);
    }


}
