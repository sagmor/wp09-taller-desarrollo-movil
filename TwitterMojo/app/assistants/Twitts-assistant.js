function TwittsAssistant() {
	/* this is the creator function for your scene assistant object. It will be passed all the 
	   additional parameters (after the scene name) that were passed to pushScene. The reference
	   to the scene controller (this.controller) has not be established yet, so any initialization
	   that needs the scene controller should be done in the setup function below. */
}

TwittsAssistant.prototype.setup = function() {
  // set up the button
  this.controller.setupWidget("ComposeButton", {}, {
  "label" : "Compose Twitt",
  "buttonClass" : "",
  "disabled" : false
  });
  
  this.controller.setupWidget("RefreshButton", {}, {
    "label" : "Refresh Twitts",
    "buttonClass" : "",
    "disabled" : false
  });


  // bind the button to its handler
  Mojo.Event.listen(this.controller.get("ComposeButton"), Mojo.Event.tap, this.composeButtonPress.bind(this));
  Mojo.Event.listen(this.controller.get("RefreshButton"), Mojo.Event.tap, this.refreshButtonPress.bind(this));
  
}

TwittsAssistant.prototype.activate = function(event) {
	   this.refreshButtonPress(null);
}


TwittsAssistant.prototype.deactivate = function(event) {
	/* remove any event handlers you added in activate and do any other cleanup that should happen before
	   this scene is popped or another scene is pushed on top */
}

TwittsAssistant.prototype.cleanup = function(event) {
	/* this function should do any cleanup needed before the scene is destroyed as 
	   a result of being popped off the scene stack */
}

TwittsAssistant.prototype.composeButtonPress = function(event){
  this.controller.stageController.pushScene("Post");
}

TwittsAssistant.prototype.refreshButtonPress = function(event){
  jQuery.getJSON('http://twitter.com/statuses/public_timeline.json?callback=?', function (data) {
    $('#Twitts ul').html('');
    jQuery.each(data, function(i, twitt) {
      $('#Twitts ul').append('<li><img src="'+twitt.user.profile_image_url+'" />'+twitt.text+'</li>')
    });
  });
}
