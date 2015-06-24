package su.arth.Controllers;

import org.codehaus.jackson.map.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import su.arth.Domen.Car;
import su.arth.Domen.User;
import su.arth.Service.CarService;

import javax.validation.Valid;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by salimhanov on 23.04.2015.
 */
@Controller
@RequestMapping("/cars")
public class CarController {

@Autowired
    CarService carService;
    @RequestMapping(method = RequestMethod.GET, params = "new")
    public String createCar(Model model){

        model.addAttribute("cars",new Car());
        return "car/edit";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String addUser(@Valid Car car, User user, BindingResult bindingResult){

        if(bindingResult.hasErrors()){
            return "car/edit";
        }
        Set<Car> cars = new HashSet<Car>(0);
        cars.add(car);
        carService.addCar(car);
        user.setCars(cars);



        return "redirect:/index";
    }


    @RequestMapping("/findByVin")
    @ResponseBody
    public  findByVin(){

        return "";
    }


}
