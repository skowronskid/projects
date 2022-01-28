package com.example.lokalizator;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RatingBar;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.google.android.gms.maps.model.LatLng;

import java.util.ArrayList;


public class DetailsActivity extends AppCompatActivity {
    Button switchToMaps;
    TextView xCoordText;
    TextView yCoordText;
    TextView titleText;
    TextView descriptionText;
    TextView googleLink;
    TextView typeText;
    Button editMarker;
    Button deleteMarkerButton;
    LocationClass location;
    ArrayList<LocationClass> locationsForm;
    XYpoint onClickLocation;
    double xCoordVal;
    double yCoordVal;
    RatingBar ratingBar;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.details_activity);


        switchToMaps = findViewById(R.id.buttonOpenMaps);
        switchToMaps.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                switchActivityToMap();
                finish();
            }
        });



        Intent i = getIntent();
        Bundle extras = i.getExtras();
        locationsForm = (ArrayList<LocationClass>) i.getSerializableExtra("lokalizacjeIntent");
        onClickLocation= (XYpoint) i.getSerializableExtra("pojedynczaLokalizacjaIntent");       //marker location

        xCoordVal = onClickLocation.getX();
        yCoordVal = onClickLocation.getY();
        for(LocationClass lc : locationsForm){//musi znalezc bo kliknalem w niego....
            if(lc.getxCoordinate() == xCoordVal && lc.getyCoordinate() == yCoordVal){
                System.out.println("jestem tu");
                location = lc;
                break;
            }
        }

        editMarker = findViewById(R.id.editMarkerButton);
        editMarker.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                LatLng latLng = new LatLng(xCoordVal,yCoordVal);
                switchActivityToForm(latLng);
                finish();
            }
        });

        deleteMarkerButton = findViewById(R.id.deleteMarker);
        deleteMarkerButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                locationsForm.remove(location);
                Toast.makeText(DetailsActivity.this,"Usunięto marker " + location.getTitle(), Toast.LENGTH_SHORT).show();
                switchActivityToMap();
                finish();
            }
        });




        xCoordText = findViewById(R.id.detailsXCoordText);
        yCoordText = findViewById(R.id.detailsYCoordText);
        titleText = findViewById(R.id.detailsTitle);
        typeText = findViewById(R.id.placeType);
        descriptionText = findViewById(R.id.description);
        googleLink = findViewById(R.id.googleTextView);
        ratingBar = findViewById(R.id.ratingBar);

        xCoordText.setText("Współrzędna x: " + location.getxCoordinate());
        yCoordText.setText("Współrzędna y: " + location.getyCoordinate());
        titleText.setText("Nazwa: " +location.getTitle());
        descriptionText.setText(location.getDescription());
        typeText.setText("Typ: " +location.getType());
        ratingBar.setRating(location.getRating());
        googleLink.setText("https://www.google.com/maps/search/?api=1&query=" + location.getxCoordinate() + "," + location.getyCoordinate());




    }

    private void switchActivityToMap() {
        Intent switchActivitiesIntent = new Intent(this, MapsActivity.class);
        switchActivitiesIntent.putExtra("lokalizacjeIntent", locationsForm);
        startActivity(switchActivitiesIntent);
    }

    private void switchActivityToForm(LatLng latlng){

        Intent switchActivitiesIntent = new Intent(this, FormActivity.class);
        switchActivitiesIntent.putExtra("lokalizacjeIntent", locationsForm);
        switchActivitiesIntent.putExtra("editingIntent", true);
        if (latlng!=null){
            switchActivitiesIntent.putExtra("pojedynczaLokalizacjaIntent",new XYpoint(xCoordVal, yCoordVal));

        }
        startActivity(switchActivitiesIntent);
    }
}

