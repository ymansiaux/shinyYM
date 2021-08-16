let raterInput = new Shiny.InputBinding();
$.extend(raterInput, {

find: function(scope) {
    return $(scope).find('.rating');
},

 initialize: function(el) {

   var options = {};

   options.max_value = $(el).data("max-value");
   options.step_size = $(el).data("step-size");
   options.initial_value = $(el).data("initial-value");
   $(el).rate(options);

},


getValue: function(el) {
return $(el).rate("getValue");
},

setValue: function(el, value) {
return $(el).rate("setValue", value);
},


// callback renvoie la valeur de getValue
subscribe: function(el, callback) {
$(el).on("change", function() {
callback();
});
},

receiveMessage: function(el, data) {
  this.setValue(el, data.value);
}
});


Shiny.inputBindings.register(
  raterInput,
  'shinyYM.raterInput'
);



