# because not all browsers have a console
log = (message) ->
  if ( window.console && window.console.log )
    window.console.log(message)

# example JS, to show everything is working as expected  
log 'hi, scripts are working'
