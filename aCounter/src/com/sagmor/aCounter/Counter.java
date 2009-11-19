package com.sagmor.aCounter;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class Counter extends Activity {
	
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        Button clickMe = (Button) findViewById(R.id.Button);
        
        clickMe.setOnClickListener(new View.OnClickListener() {
        	int count = 0;
        	TextView label =  (TextView) findViewById(R.id.Label);
        	
			public void onClick(View v) {
				count++;
				label.setText("" + count );
			}
		});
        
        
    }
}