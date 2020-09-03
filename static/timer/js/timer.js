$(function () {

  // Cookieの中からCSRF-Tokenを取得
  function getCookie(name) {
    let cookieValue = null;
    if(document.cookie && document.cookie !== '') {
      const cookies = document.cookie.split(';');
      for(let i = 0; i < cookies.length; i++) {
        const cookie = jQuery.trim(cookies[i]);
        if(cookie.substring(0, name.length + 1) === (name + '=')) {
          cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
          break;
        }
      }
    }
    return cookieValue;
  };

  // CSRF-Tokenを使用しないHTTPメソッド郡
  function csrfSafeMethod(method) {
    return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
  };

  const worker = new Worker('/static/timer/js/worker.js');

  // 経過時間(秒)
  let elapsed = 0;
  let timerIntervalId = null;
  let timer = null;
  const clockCycle = 60;
  $('#time').val(updateTime());

  $('#timer-start').click(function() {
    const url = '/timer/detail/';
    const name = $('#task-name').val();
    const now = new Date();
    const year = now.getFullYear();
    const month = now.getMonth() + 1;
    const day = now.getDate();
    $.ajax({
      url: url,
      type: 'GET',
      dataType: 'json',
      data: {'name': name, 'year': year, 'month': month, 'day': day},
      success: function(data) {
        elapsed = data.elapsed_time;
        updateTime();
        displayStopTimer();
        $('#task-name').prop('disabled', true);
        backgroundTimerProcess();
        timer = data;
      },
      error: function(data) {
        alert('error');
      }
    });
  });

  $('#timer-stop').click(function() {
    let url = '/timer/create/';
    if(timer.id) { url = `/timer/${timer.id}/update/`; }
    const token = getCookie('csrftoken');
    const name = $('#task-name').val();
    $.ajax({
      url: url,
      type: 'POST',
      dataType: 'json',
      data: {'name': name, 'elapsed_time': elapsed},
      beforeSend: function(xhr, settings) {
        if(!csrfSafeMethod(settings.type) && !this.crossDomain) {
          xhr.setRequestHeader('X-CSRFToken', token);
        }
      },
      success: function(data) {
        $('#task-name').prop('disabled', false);
        displayStartTimer();
        timerStop();
      },
      error: function(data) {
        $('#task-name').prop('disabled', false);
        displayStartTimer();
        timerStop();
        alert('error');
      }
    });
  });

  function displayStartTimer() {
    $('#timer-stop').hide();
    $('#timer-start').show();
  };

  function displayStopTimer() {
    $('#timer-start').hide();
    $('#timer-stop').show();
  };

  function updateTime() {
    const sec = elapsed % clockCycle;
    const min = Math.floor(elapsed / clockCycle) % clockCycle;
    const hour = Math.floor(elapsed / (clockCycle * clockCycle));

    const display_sec = ('0' + sec).slice(-2);
    const display_min = ('0' + min).slice(-2);
    const display_hour = ('0' + hour).slice(-2);

    $('#time').html(display_hour + ':' + display_min + ':' + display_sec);
  };

  function timerStop() {
    backgroundTimerProcess();
    clearInterval(timerIntervalId);
    timerIntervalId = null;
  };

  function backgroundTimerProcess() {
    worker.postMessage({'intervalId': timerIntervalId, 'elapsed': elapsed});
    worker.onmessage = function(event) {
      timerIntervalId = event.data.intervalId;
      elapsed = event.data.elapsed;
      updateTime();
    };
  }

});