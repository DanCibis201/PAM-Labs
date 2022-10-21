package com.example.mynewapp;

import androidx.appcompat.app.AppCompatActivity;

import androidx.core.app.NotificationCompat;
import androidx.core.app.NotificationManagerCompat;

import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.SearchManager;
import android.content.Intent;

import android.os.Build;
import android.os.Bundle;

import android.provider.MediaStore;

import android.widget.Button;
import android.widget.EditText;




public class MainActivity extends AppCompatActivity {
    //pot exista mai multe notificare si o vom folosi drept ID/identitate
    private static final String CHANNEL_ID = "channel_id01";
    private static final int NOTIFICATION_ID = 1;

    EditText editText;
    Button btnSearch;
    Button BCamera;
    Button FCamera;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button showNotificationBtn = findViewById(R.id.showNotificationBtn);
        showNotificationBtn.setOnClickListener(v -> {
            //apasam pe buton pentru notificare
            showNotification();
        });

        editText = findViewById(R.id.editText);
        btnSearch = findViewById(R.id.btnSearch);
        btnSearch.setOnClickListener(v -> {
                Intent intent = new Intent(Intent.ACTION_WEB_SEARCH);
                String input = editText.getText().toString();
                intent.putExtra(SearchManager.QUERY, input);
                startActivity(intent);
        });

        BCamera = (Button) findViewById(R.id.BackCamera);
        BCamera.setOnClickListener(v -> {
            Intent Intent1 = new Intent(MediaStore.INTENT_ACTION_STILL_IMAGE_CAMERA);
            startActivity(Intent1);
        });

        FCamera = (Button) findViewById(R.id.FrontCamera);
        FCamera.setOnClickListener(v -> {
            Intent Intent2 = new Intent(MediaStore.INTENT_ACTION_STILL_IMAGE_CAMERA);
            startActivity(Intent2);
        });

    }

    private void showNotification() {

        createNotificationChannel();

        //cream notificarea
        NotificationCompat.Builder builder = new NotificationCompat.Builder(this, CHANNEL_ID);
        //icon
        builder.setSmallIcon(R.drawable.ic_notification);
        //title
        builder.setContentTitle("Hello! I'm your notification!");
        //description
        builder.setContentText("Congrats!! You've made it!");
        //set priority
        builder.setPriority(NotificationCompat.PRIORITY_HIGH);
        //high priority notifications trigger the heads-up notification display.

        //notification manager
        NotificationManagerCompat notificationManagerCompat = NotificationManagerCompat.from(this);
        notificationManagerCompat.notify(NOTIFICATION_ID, builder.build());
    }

    private void createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O){
            //swipe notifications
            CharSequence name = "My Notification";
            String description = "My notification description";
            //importance of clicking
            int importance = NotificationManager.IMPORTANCE_DEFAULT;

            NotificationChannel notificationChannel = new NotificationChannel(CHANNEL_ID, name, importance);
            notificationChannel.setDescription(description);

            NotificationManager notificationManager = (NotificationManager)getSystemService(NOTIFICATION_SERVICE);

            notificationManager.createNotificationChannel(notificationChannel);
        }
    }



}