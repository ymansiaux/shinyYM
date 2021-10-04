// Gestion de la fonction alert de notie
Shiny.addCustomMessageHandler("alertNotie",  function(message) {
        notie.alert(message);
});

// Gestion de la fonction confirm de notie
Shiny.addCustomMessageHandler("confirmNotie", function(message) {

        message.notie_params.submitCallback = function() {
              Shiny.setInputValue(message.inputId, true);
        };

       message.notie_params.cancelCallback = function() {
              Shiny.setInputValue(message.inputId, false);
        };

      notie.confirm(message.notie_params);
});


// Gestion de la fonction date de notie
Shiny.addCustomMessageHandler("dateNotie", function(message) {

        message.notie_params.submitCallback = function(date) {
              Shiny.setInputValue(message.inputId, date);
        };

       message.notie_params.cancelCallback = function(date) {
              Shiny.setInputValue(message.inputId, null);
        };

      notie.date(message.notie_params);
});


// Gestion de la fonction input de notie
Shiny.addCustomMessageHandler("inputNotie", function(message) {

        message.notie_params.submitCallback = function(value) {
              Shiny.setInputValue(message.inputId, value);
        };

       message.notie_params.cancelCallback = function(value) {
              Shiny.setInputValue(message.inputId, null);
        };

      notie.input(message.notie_params);
});

