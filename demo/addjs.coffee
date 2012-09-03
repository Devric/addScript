###
    
======
put this in the top
======

addScript = {};


======
AddScript samples
======

<script type="text/javascript">
    addScript['jquery'] = 'http://code.jquery.com/jquery.min.js'; </script>


======
CALL BACK function Samples
======

window.twitterReady = ->
  console.log 'twitter is loaded'

window.jqueryReady = ->
  console.log 'jquery is loaded'

###

fjs = document.getElementsByTagName('script')[0]

###*
 *
 *  Add javascript () ###
window.add = ( id, src, callback ) ->

  ###*
   *
   * If the id exists, skip ###

  if document.getElementsByTagName id
    undefined

  js = document.createElement 'script'
  js.src = src
  id && ( js.id = id )
  fjs.parentNode.insertBefore js, fjs

  # console.log '+++ ' + id + ' is loaded'

  window[callback]() if callback && typeof window[callback] == 'function'

###*
 *
 * Loop through addScript obj, and addJs ###

addScripts = (->
  for id, src of window.addScript
    add id, src, id + 'Ready'
)()
