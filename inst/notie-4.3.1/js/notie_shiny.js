// Gestion de la fonction alert de notie
Shiny.addCustomMessageHandler("alertenotie",  function(message) {
        notie.alert(message);
});



Shiny.addCustomMessageHandler("confirmnotie",
                              function(message) {

                                console.log(message);

                                message.config.submitCallback = function() {
                                  Shiny.setInputValue(data.id, true);
                                };

                                 message.config.cancelCallback = function() {
                                  Shiny.setInputValue(data.id, false);
                                };

                                notie.confirm(message.config
                                );


                              });



