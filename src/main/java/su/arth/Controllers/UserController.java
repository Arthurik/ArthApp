package su.arth.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import su.arth.Domen.Car;
import su.arth.Domen.User;
import su.arth.Service.UserService;

import javax.validation.Valid;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by salimhanov on 20.04.2015.
 */
@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;




    @RequestMapping(method = RequestMethod.GET,params = "new")
    public String createUser(Model model){


       // modelAndView.addObject("user",new User());
        model.addAttribute("users",new User());
        model.addAttribute("cars",new Car());

                return "user/edit";
    }



    @RequestMapping(method = RequestMethod.POST)
    public String addUser(@Valid User user, Car car, BindingResult bindingResult){
      /*  List<User> users = userService.listUser();
        Iterator<User> iterator = users.iterator();
        while (iterator.hasNext()){
            int i=0;
           if(users.get(i).getLogin()==user.getLogin()){

               return "user/edit";
           }
        }
      */
        if(bindingResult.hasErrors()){
           return "user/edit";
        }
        Set<Car> cars = new HashSet<Car>();
        cars.add(car);
        user.setCars(cars);
        userService.addUser(user);
      //  carService.addCar(car);

return "redirect:/cars?new";
       // return "redirect:/users/"+user.getLogin();
    }


    @RequestMapping(value="/{login}", method=RequestMethod.GET)
    public String showProfile(@PathVariable String login,
                                     Model modelAndView) {
               modelAndView.addAttribute(userService.getUser(login));
        return "user/user";
    }





     @RequestMapping(value = "/edit/{login}",method = RequestMethod.GET)
    public String editUser(ModelAndView modelAndView,@PathVariable String login) {

         return "user/edit";
     }







}
