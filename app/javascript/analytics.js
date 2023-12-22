class Analytics {
  push(event) {
    if (typeof _gaq !== 'undefined' && _gaq !== null) {
      _gaq.push.apply(_gaq, arguments);
    }

    if (this.debug) {
      let args = arguments[0];
      return (this.events || (this.events = [])).push(args);
    }
  }
}

window.Analytics = new Analytics();
