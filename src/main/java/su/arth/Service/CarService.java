package su.arth.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import su.arth.Dao.CarDao;
import su.arth.Domen.Car;

import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by arthur on 16.04.15.
 */
@Service
public class CarService  {

    @Autowired
    private CarDao carDao;

    @Transactional
    public void addCar(Car car){
        carDao.addCar(car);
    }


    @Transactional
    public List<Car> listCar(){
        return carDao.listCar();
    }


    @Transactional
    public Car findByVin(String vincode){
        return carDao.findByVin(vincode);
    }

}
