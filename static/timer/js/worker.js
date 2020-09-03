onmessage = function(event) {
  if(event.data.intervalId !== null) {
    clearInterval(event.data.intervalId);
    event.data.intervalId = null;
    this.postMessage({'intervalId': event.data.intervalId, 'elapsed': event.data.elapsed})
  } else {
    event.data.intervalId = setInterval(() => {
      event.data.elapsed++;
      this.postMessage({'intervalId': event.data.intervalId, 'elapsed': event.data.elapsed});
    }, 1000);
  }
};