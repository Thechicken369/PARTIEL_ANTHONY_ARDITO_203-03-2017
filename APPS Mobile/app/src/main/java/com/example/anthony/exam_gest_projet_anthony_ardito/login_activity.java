package com.example.anthony.exam_gest_projet_anthony_ardito;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class login_activity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login_activity);









    }

    public boolean utiliExist(String name,String mdp){
        String url = "http://10.0.2.2:80/exam_web_service/login/";
        connect_WebService myConnect = new connect_WebService();
        String test = myConnect.requestContent(url,null);

        boolean returnstate = false;
        try{
            JSONArray jArray = new JSONArray(test);
            for(int i=0;i<jArray.length();i++) {

                //Test si un utilisateur est present dans la base
                JSONObject json_data = jArray.getJSONObject(i);
                String nom = json_data.getString("UTI_Nom");
                String mdp11 = json_data.getString("UTI_MDP");
                if ( (nom.equals(name)) && (mdp11.equals(mdp)))
                {
                    returnstate = true;
                }

            }

        }catch(JSONException e){
                Log.e("log_tag", "Error parsing data "+e.toString());
        }finally
            {
            return returnstate;}
        }

    public void connectUser(View v){

        EditText nomUtili = (EditText) findViewById(R.id.editText_utili);
        EditText mdp = (EditText) findViewById(R.id.editText2_mdp);
        String nom = nomUtili.getText().toString();
        String mdpString = mdp.getText().toString();
        boolean test = utiliExist(nomUtili.getText().toString(),mdpString);

        if(utiliExist(nomUtili.getText().toString(),mdpString))   {
            Intent intent = new Intent(this,list_projet.class);
            intent.putExtra("nom",nomUtili.getText().toString());
            //intent.putExtra("mdp",mdp.getText().toString());
            startActivity(intent);
        }else
        {
            Toast.makeText(getBaseContext(),"Identification incorect",Toast.LENGTH_SHORT).show();
        }
    }
}
