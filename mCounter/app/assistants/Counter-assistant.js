function CounterAssistant() {
}

CounterAssistant.prototype.setup = function() {
  
  this.counter = 0;
  
	this.controller.setupWidget("Button", {}, {
    label: "Click Me!",
    buttonClass: "",
    disabled: false
  });
  
  Mojo.Event.listen(this.controller.get("Button"), Mojo.Event.tap, this.clickMe.bind(this));
}

CounterAssistant.prototype.clickMe = function(event) {
  this.counter++;
  $('#label').html(''+this.counter);
}