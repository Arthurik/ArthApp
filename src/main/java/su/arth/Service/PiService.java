package su.arth.Service;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;

/**
 * Created by salimhanov on 31.03.2015.
 */
@Service
public class PiService {

@Autowired
CarService carService;

    public String getStatus() {
          StringBuilder status = new StringBuilder();
        try {

            HttpClient httpClient = HttpClientBuilder.create().build();
           // http://25.141.120.137/ArthAppPi
            HttpGet getRequest = new HttpGet("/status");
                 //   getRequest.addHeader("accept", "application/json");

            HttpResponse httpResponse = httpClient.execute(getRequest);

            if (httpResponse.getStatusLine().getStatusCode() != 200) {

                System.out.println("Error: "+httpResponse.getStatusLine().getStatusCode());
            }

            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(httpResponse.getEntity().getContent()));
            String brString;
            while ((brString = bufferedReader.readLine()) != null) {
                   status.append(brString+"\n");
                //responseJSON.append(brString+ "\n");
            }
            // car.setStatus(status.toString());

            // JSONObject jsonObject = new JSONObject(responseJSON);
           // status = responseJSON.toString();

            //car.setStatus(status);

        } catch (IOException e){
            System.out.println("Error: io");
            e.printStackTrace();
        }
         return "";
         }


/*
    public String pingStatus() {
        System.out.println("ping status");
       StringBuilder response = new StringBuilder();
        String status = "";

           try {

            HttpClient httpClient = HttpClientBuilder.create().build();
            HttpGet getRequest = new HttpGet(car.getUrl()+"/status");
           // getRequest.addHeader("accept", "application/json");

            HttpResponse httpResponse = httpClient.execute(getRequest);

            if (httpResponse.getStatusLine().getStatusCode() != 200) {
                System.out.println("Error: "+httpResponse.getStatusLine().getStatusCode());
                car.setStatus("01");
                return "01";
                //LOG.debug("Ответ от pi" + httpResponse.getStatusLine().getStatusCode() + " ");
            }
              Scanner sc = new Scanner(httpResponse.getEntity().getContent());
               while (sc.hasNext()){
                   response.append(sc.next());
               }
            */
/*BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(httpResponse.getEntity().getContent()));
            String brString;
            while ((brString = bufferedReader.readLine()) != null) {
                responseJSON.append(brString+ "\n");
            }*//*


            // JSONObject jsonObject = new JSONObject(responseJSON);
            status = response.toString();

               car.setStatus(status);


        } catch (IOException e){
            e.printStackTrace();
        }



       return status;
    }
*/

    public void playAlarm(){
   /* Runnable play = new Alarm();
        Thread thread = new Thread(play);
        thread.start();*/





    }


    public void sendMessagePhone(String message){
        String url="http://sms.ru/sms/send?api_id=4cc57f7a-7693-8ee4-510e-d62fd35e40a0&to=79517822199&text=";

        try {
            HttpClient httpClient = HttpClientBuilder.create().build();
            HttpGet getRequest = new HttpGet(url+message);

            HttpResponse httpResponse = httpClient.execute(getRequest);
            System.out.println(httpResponse.getStatusLine().getStatusCode());

            Scanner sc = new Scanner(httpResponse.getEntity().getContent());
            StringBuilder response= new StringBuilder();
            while (sc.hasNext()){
                response.append(sc.next()+"\n");
            }

            System.out.println(response.toString());


        } catch (Exception e)
        {
            e.printStackTrace();
        }



    }



}
