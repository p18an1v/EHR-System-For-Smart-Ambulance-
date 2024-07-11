/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servletpages;

import MFS100.DeviceInfo;
import MFS100.FingerData;
import MFS100.MFS100;
import javax.swing.JOptionPane;

/**
 *
 * @author Pramod
 */
public class FingerScan {

    static boolean flag = true;
    String appTitle = "MANTRA.MFS100.Test";
    String key = "";
    MFS100 mfs100 = null;
    DeviceInfo deviceInfo = new DeviceInfo();
    int quality = 60;
    int timeout = 10000;
    byte[] ISOTemplate = null;
    byte[] ANSITemplate = null;
    public static byte[] myfingerdata;

    public FingerScan() {
        mfs100 = new MFS100(null, key);
    }

    public void init() {
        int ret = mfs100.Init();
        if (ret == 0) {
            deviceInfo = mfs100.GetDeviceInfo();

        } else {
            System.out.println("Error");

        }
    }

    public void scanFinger() {
        Runnable runnable = new Runnable() {
            @Override
            public void run() {
                FingerData fingerData = new FingerData();
                int ret = mfs100.AutoCapture(fingerData, timeout, true, true);
                if (ret == 0) {
                    /*      m_FingerPrintImage.setImage(mfs100.BytesToBitmap(fingerData.FingerImage()));
                    lblFinger.setIcon(m_FingerPrintImage);
                    lblFinger.repaint();
                    lblQuality.setText("Quality: " + String.valueOf(fingerData.Quality()) + " Nfiq: " + String.valueOf(fingerData.Nfiq()));
                    lblQuality.repaint();*/

                    ISOTemplate = new byte[fingerData.ISOTemplate().length];
                    System.arraycopy(fingerData.ISOTemplate(), 0, ISOTemplate, 0, fingerData.ISOTemplate().length);
                  
                        myfingerdata = ISOTemplate;
                        
                    
                    System.out.println("Finger Data Stored..");
                    // ANSITemplate = new byte[fingerData.ANSITemplate().length];
                    // System.arraycopy(fingerData.ANSITemplate(), 0, ANSITemplate, 0, fingerData.ANSITemplate().length);

                    /*        WriteBytesToFile("FingerImage.bmp", fingerData.FingerImage());
                    WriteBytesToFile("ISOTemplate.iso", fingerData.ISOTemplate());
                    WriteBytesToFile("ISOImage.iso", fingerData.ISOImage());
                    WriteBytesToFile("AnsiTemplate.ansi", fingerData.ANSITemplate());
                    WriteBytesToFile("RawData.raw", fingerData.RawData());
                    WriteBytesToFile("WSQImage.wsq", fingerData.WSQImage());*/
                    //    JOptionPane.showMessageDialog(rootPane, "Capture Success.\nFinger data is saved at application path" ,appTitle,JOptionPane.INFORMATION_MESSAGE );
                } else {
                    System.out.println("Something goes wrong..");
                }
            }
        };

        Thread trd = new Thread(runnable);

        trd.start();
    }

    public boolean fingerMatch(byte[] isoTemplate) {
        int score = 0;
        score = mfs100.MatchISO(isoTemplate, myfingerdata);
        if (score >= 14000) {
           return true;
        } else {
            return false;
        }
    }
}
