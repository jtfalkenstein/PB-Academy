/**
 * When called, this selects all elements with the class 'shadowbox' and addes
 * the hover shadowing functionality.
 */
var hoverShadow = function(){
    var sboxes = document.getElementsByClassName('shadowbox');
    for(var i = 0; i < sboxes.length; i++){
        var sbox = sboxes[i];
        var superimpose = sbox.getElementsByClassName('superimpose')[0];
        if(typeof superimpose != 'undefined'){
            superimpose.style.opacity = ".4";
            superimpose.style.filter = "alpha(opacity=40)";
        }
        sbox.addEventListener('mouseenter',function(){
            this.style.boxShadow = '0 0 10px black';
            var superimpose = this.getElementsByClassName('superimpose')[0];
            if(typeof superimpose != 'undefined'){
                superimpose.style.opacity = "1";
                superimpose.style.filter = "alpha(opacity=100)";
            }
        });
        sbox.addEventListener('mouseleave',function(){
            this.style.boxShadow = 'none';
            var superimpose = this.getElementsByClassName('superimpose')[0];
            if(typeof superimpose != 'undefined'){
                superimpose.style.opacity = ".4";
                superimpose.style.filter = "alpha(opacity=40)";
            }
        });
    };
};

/**
 * Used to add the tooltip functionality to the nav bar sections.
 */
var navbar = {
    buttonMouseEnter: function(e){
        jQuery(e.delegateTarget).children('.NavBar-tooltip').css("display","block");
    },
    buttonMouseLeave: function(e){
        jQuery(e.delegateTarget).children('.NavBar-tooltip').css("display","none");
    }
};

/**
 * On page load, add the event listeners...
 * @returns {undefined}
 */
jQuery(function(){
   hoverShadow();
   if(!isMouseEventSupported('touchstart')){ //If the device IS NOT a touch screen...
       jQuery('.navDiv').mousemove(function(e){navbar.buttonMouseEnter(e)});
       jQuery('.navDiv').mouseleave(function(e){navbar.buttonMouseLeave(e)});
   }
});

/**
 * This tests whether or not a specific event is supported by the browser.
 * @param {string} eventName
 * @returns {Boolean}
 */
function isMouseEventSupported(eventName) {
    var el = document.createElement('div');
    eventName = 'on' + eventName;
    var isSupported = (eventName in el);
    if (!isSupported) {
      el.setAttribute(eventName, 'return;');
      isSupported = typeof el[eventName] == 'function';
    }
    el = null;
    return isSupported;
  }