package su.arth.Service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import su.arth.Dao.UserDao;
import su.arth.Domen.User;

import java.util.List;

/**
 * Created by salimhanov on 15.04.2015.
 */
@Service
public class UserService {
    private static final Logger logger = Logger.getLogger(UserService.class);


    @Autowired
    private UserDao userDao;

    @Transactional(propagation = Propagation.REQUIRED,readOnly = false)
public void addUser(User user){
       List<User> listUser = userDao.listUser();

    userDao.addUser(user);

}


public List<User> listUser(){
    return userDao.listUser();
}

    @Transactional(propagation = Propagation.REQUIRED,readOnly = false)
    public User getUser(String login){
        /*try {
            User user = userDao.getUser(login);
        } catch (Exception e){
            logger.debug("user is username: "+login+" not fount");
                }
        */
        return userDao.getUser(login);

    }











}
