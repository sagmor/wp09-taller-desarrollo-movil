package com.sagmor.twittrobot;

import java.util.List;

import android.app.Activity;
import android.app.ListActivity;
import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;
import winterwell.jtwitter.*;
import winterwell.jtwitter.Twitter.Status;

public class Twitts extends Activity {
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        
        Button composeTweet = (Button) findViewById(R.id.ComposeButton);
        composeTweet.setOnClickListener(new View.OnClickListener() {        	
			public void onClick(View v) {
				
			}
		});

        
        Button refreshTweets = (Button) findViewById(R.id.RefreshButton);
        final Context context = this;
        refreshTweets.setOnClickListener(new View.OnClickListener() {        	
			public void onClick(View v) {
				
				Twitter twitter = new Twitter();
				List<Status> statuses= twitter.getPublicTimeline();
				
				ListView list = (ListView)  findViewById(R.id.list);
				
				String[] twitts = new String[statuses.size()];
				
				for (int i = 0; i < twitts.length; i++) {
					twitts[i] = statuses.get(i).text;
				}
					
				//list.setAdapter( new ArrayAdapter<Status>(context, 
				//	android.R.layout.simple_list_item_1, statuses));
				
				list.setAdapter( new ArrayAdapter<String>(context, 
						android.R.layout.simple_list_item_1, twitts));
				
			}
		});
        
        refreshTweets.performClick();

    }
}