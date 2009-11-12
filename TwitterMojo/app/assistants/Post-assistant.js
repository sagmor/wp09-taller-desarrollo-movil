function PostAssistant() {
	/* this is the creator function for your scene assistant object. It will be passed all the 
	   additional parameters (after the scene name) that were passed to pushScene. The reference
	   to the scene controller (this.controller) has not be established yet, so any initialization
	   that needs the scene controller should be done in the setup function below. */
}

PostAssistant.prototype.setup = function() {
  this.controller.setupWidget("TwittText", {
    multiline: true,
    enterSubmits: false,
    focus: true
  }, {
    value: "",
    disabled: false
  });
  
  this.controller.setupWidget("PostButton", {}, {
    label: "Post!",
    buttonClass: "",
    disabled: false
  });
  
  Mojo.Event.listen(this.controller.get("PostButton"), Mojo.Event.tap, this.postTwittButton.bind(this));
}


PostAssistant.prototype.postTwittButton = function(event) {
  var user = $('#TwittUser').attr('value');
  var pass = $('#TwittPass').attr('value');
  
  jQuery.post('https://'+user+':'+pass+'@twitter.com/statuses/update.json', {
    status: $('#TwittText').attr('value')
  });
}
