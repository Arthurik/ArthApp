package su.arth.Controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import su.arth.Service.PiService;

/**
 * Created by salimhanov on 18.03.2015.
 */
@Controller
public class PiController implements Runnable {

    @Autowired
    private PiService piService;
// private PiService piService = new PiService();
private static int count;

    @Override
    public void run() {
        String status="";
        System.out.println("thread is starting"+count++);
        while (true){
             status = piService.getStatus();

            if(status=="01") {
                piService.sendMessagePhone("CarIsNotResponding");
            }

            try {
                Thread.sleep(10000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

    }
}
