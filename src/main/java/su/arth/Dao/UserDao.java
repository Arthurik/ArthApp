package su.arth.Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import su.arth.Domen.User;

import java.util.List;

/**
 * Created by salimhanov on 14.04.2015.
 */
@Repository
/*@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)*/
public class UserDao {

@Autowired
    private SessionFactory sessionFactory;
   /* @Transactional(propagation = Propagation.REQUIRED,readOnly = false)*/
   /*@SuppressWarnings("unchecked")*/
public void addUser(User user){
       sessionFactory.getCurrentSession().save(user);

   /* sessionFactory.getCurrentSession().flush();*/
}

    @SuppressWarnings("unchecked")
    public List<User> listUser() {

        return sessionFactory.getCurrentSession().createQuery("from User")
                .list();
    }

public User getUser(String login){
User user = null;
    try {
        Session session = sessionFactory.getCurrentSession();
         user = (User) session.createQuery("from User where login = :login").setParameter("login", login).list().get(0);
    }
    catch (Exception e){

    }


    return user;
}


}
