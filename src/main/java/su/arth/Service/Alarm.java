package su.arth.Service;/*
package su.su.arth.Service;

import org.springframework.stereotype.Service;

import javax.sound.sampled.*;
import java.io.File;
import java.io.IOException;

*/
/**
 * Created by arthur on 08.04.15.
 *//*

@Service
public class Alarm implements Runnable {

    @Override
    public void run() {
        try {
        File soundFile =  new File(Alarm.class.getResource("alarm.wav").getFile());
        AudioInputStream audioInputStream =  AudioSystem.getAudioInputStream(soundFile);
            Clip clip = AudioSystem.getClip();

            //Загружаем наш звуковой поток в Clip
            //Может выкинуть IOException и LineUnavailableException
            clip.open(audioInputStream);

            clip.setFramePosition(0); //устанавливаем указатель на старт
            clip.start(); //Поехали!!!

            //Если не запущено других потоков, то стоит подождать, пока клип не закончится
            //В GUI-приложениях следующие 3 строчки не понадобятся
            Thread.sleep(clip.getMicrosecondLength()/1000);
            clip.stop(); //Останавливаем
            clip.close();

        } catch (UnsupportedAudioFileException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (LineUnavailableException e) {
            e.printStackTrace();
        }

    }
}
*/
