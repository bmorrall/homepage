import $ from "jquery";

import Konami from "../../vendor/javascripts/konami";

import "../../vendor/javascripts/modernizr-audio";

$(function() {
  let spiderpigLabel = $('#spiderpig-label').text();
  let callbackPID = null;

  // Setup Raptorize
  raptorize.config({
    playAudio: Modernizr.audio,
    imageSource: $('body').data('image-source'),
    audioSources: $('body').data('audio-sources'),
    swarmAudioSources: $('body').data('swarm-audio-sources')
  })

  // Attach the Raptor
  $('#spiderpig img')
    .raptorize()
    .click(function(e){
      Analytics.push(['_trackEvent', 'welcome', 'clickedPig']);
      return true;
  }); // Don't prevent callback

  // Attach the Swarm
  new Konami(function() {
    // Stop the User Label Scrolling
    clearTimeout(callbackPID);
    $('#spiderpig-label').text('!!! RAPTOR SWARM !!!');

    // Release the Swarm
    Analytics.push(['_trackEvent', 'welcome', 'konamiCode']);
    raptorize.raptorSwarm();

    // Resume scrolling the User Label (30 seconds)
    setTimeout(spiderpigCallback, 30000);
    return true; // Run find
  });

  // Update the User's label
  var spiderpigCallback = function() {
    if ($('#spiderpig-label').text() === spiderpigLabel) {
      $('#spiderpig-label').text('//github.com/bmorrall');
    } else {
      $('#spiderpig-label').text(spiderpigLabel);
    }
    callbackPID = setTimeout(spiderpigCallback,4000);
  };
  callbackPID = setTimeout(spiderpigCallback,6000);
  $('#spiderpig-label').click(function() {
    clearTimeout(callbackPID);
    spiderpigCallback();
  });
});
