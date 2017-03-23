package com.example.anthony.exam_gest_projet_anthony_ardito;

import android.os.StrictMode;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Created by anthony on 23/03/2017.
 */

public class connect_WebService {

    public String requestContent(String url,String param){
        String result = null;
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);
        try {



            URL url1 = new URL(url);
            HttpURLConnection connection = (HttpURLConnection) url1.openConnection();

            connection.setDoOutput(true);
            connection.setInstanceFollowRedirects(false);
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "text/plain");
            connection.setRequestProperty("charset", "utf-8");

            if(param != null) {
                OutputStreamWriter writer = new OutputStreamWriter(connection.getOutputStream());

                writer.write(param);
                writer.flush();
            }



            connection.connect();
            InputStream inputStream = connection.getInputStream();

            result = InputStreamOperations.InputStreamToString(inputStream);

            // On récupère le JSON complet
            //JSONArray jsonObject = new JSONArray(result);

        }
            catch (Exception e) {
        e.printStackTrace();
    }
    return  result;

    }



}
