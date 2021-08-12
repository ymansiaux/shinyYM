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



