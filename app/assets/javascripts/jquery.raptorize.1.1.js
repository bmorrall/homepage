/*
 * jQuery Raptorize Plugin 1.0
 * www.ZURB.com/playground
 * Copyright 2010, ZURB
 * Free to use under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
*/


(function($) {

  // Yo' defaults
  var defaults = {
    classname: 'raptor', // classname of the raptor div
    playAudio: true, // should it make a noise
    imageSource: null, // image of the raptor
    audioSources: [], // array of sounds that the raptor plays
    delayTime: 5000 // time before raptor attacks on timer mode
  };

  var raptor = (function(options) {
    var options = $.extend(defaults, options);
    var locked = false; // Don't make it too aggressive

    // Build the image element
    var imageElement = document.createElement('img')
    imageElement.className = options.classname;
    imageElement.src = options.imageSource;

    // Build the audio element
    var audioElement = document.createElement('audio');
    audioElement.preload = 'auto';
    for (i in options.audioSources) {
      var source = document.createElement('source');
      source.src = options.audioSources[i];
      audioElement.appendChild(source)
    }

    // Add it to the dom
    document.body.appendChild(imageElement);
    document.body.appendChild(audioElement);

    // And put it in place
    var $raptor = $(imageElement);
    $raptor.css({
      "position":"fixed",
      "bottom": "-700px",
      "right" : "0",
      "display" : "block"
    });

    return {
      // Movement Hilarity
      animate: function(callback) {
        $raptor.animate({
          "bottom" : "0"
        }, function() {
          $raptor.animate({
            "bottom" : "-130px"
          }, 100, function() {
            var offset = ($raptor.position().left + 400);
            $raptor.delay(300).animate({
              "right" : offset
            }, 2200, function() {
              $raptor.css({
                "bottom": "-700px",
                "right" : "0"
              })
              if (callback) { callback() }
            })
          });
        });
        return this;
      },
      // Sound Hilarity
      shreik: function() {
        audioElement.play();
        return this;
      },
      // Total Hilarity
      unleash: function() {
        // Check its cage
        if (locked) return this;
        locked = true;

        if (options.playAudio) {
          this.shreik();
        }

        this.animate(function() {
          locked = false;
        });

        return this;
      }
    };
  });

  // Create the Raptor Factory
  window.raptorize = {
    // Allow Raptor to be changed
    raptor: raptor,
    // Quickly fire off a Raptor
    quickSpawn: function(options) {
      return new raptorize.raptor(options).unleash();
    },
    // Fire on Konami Code
    onTimer: function(options) {
      var delayTime = defaults.delayTime || options.delayTime;
      var callback = function() { raptorize.quickSpawn(options); }
      setTimeout(callback, delayTime);
    },
    // Fire on Konami Code
    onKonami: function(options) {
      var kkeys = [], konami = "38,38,40,40,37,39,37,39,66,65";
      $(window).bind("keydown.raptorz", function(e) {
        kkeys.push( e.keyCode );
        if ( kkeys.toString().indexOf( konami ) >= 0 ) {
          raptorize.quickSpawn(options);
          $(window).unbind('keydown.raptorz');
        }
      }, true);
    }
  };

  // Add the jQuery plugin
  $.fn.raptorize = function(options) {
    return this.each(function() {
      var _this = $(this);
      _this.bind('click', function(e) {
        e.preventDefault();
        raptorize.quickSpawn(options);
      });
    });
  }

})(jQuery);

