# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('#fermer_postcode').jpostal({
    postcode : ['#fermer_postcode' ],
    address  : {
                  '#fermer_prefecture_code' : "%3",
            	  '#fermer_address_city' : "%4",
     		      '#fermer_address_street' : "%5%6",
      		    	'#fermer_address_building' : "%7"
                }
  })