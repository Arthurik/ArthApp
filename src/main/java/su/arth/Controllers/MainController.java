package su.arth.Controllers;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import su.arth.Service.UserService;


/**
 * Created by Артур on 24.01.2015.
 */
@Controller
@RequestMapping("/")
public class MainController {

    private static final Logger logger = Logger.getLogger(MainController.class);


    @Autowired
private UserService userService;


    @RequestMapping("/")
    public String index(ModelAndView modelAndView){
        /*  Runnable runnable = new PiController();
          Thread thread = new Thread(runnable);
          thread.start();*/

        return "index";
    }


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(ModelAndView modelAndView){

        return "login/signin";
    }

    @RequestMapping(value = "/login/{error}", method = RequestMethod.GET)
    public String registerError(ModelAndView modelAndView, @PathVariable final String error){
        modelAndView.addObject("error",error);
        return "login/error";
    }


    @RequestMapping("/login/logout" )
    public  String logout(){
        return "login/logout";
    }


/*

 @RequestMapping(value = "/user/add",method = RequestMethod.POST)
  public String addUser(ModelAndView modelAndView,String email, String password, String lastname, String firstname){
//      modelAndView.addObject(new User(username,password,lastname,firstname));

     return "user/user";
 }
*/






    @RequestMapping("/auto")
    public String auto(ModelAndView modelAndView){

         //  piService.getStatus();
        return "auto";
    }


    @RequestMapping("/sendMessage")
    public String sendMessage(ModelAndView modelAndView){
      //  piService.sendMessagePhone("Danger");
        return "auto";
    }

   /* @RequestMapping(value = "/user/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user){
        userService.addUser(user);

        return "redirect:index";
    }

*/
   @RequestMapping("/admin")
    public String editPortal(ModelAndView modelAndView){
       return "index";
   }




}
