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

  // 経過時間(秒)
  let elapsed = localStorage.getItem('elapsed') ? localStorage.getItem('elapsed') : 0;
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
        localStorage.setItem('isStart', true);
        elapsed = data.elapsed_time;
        updateTime();
        displayStopTimer();
        $('#task-name').prop('disabled', true);
        MeasurementElapsedTime();
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

  function MeasurementElapsedTime() {
    if(timerIntervalId !== null) { return; }
    console.log(timerIntervalId)
    timerIntervalId = setInterval(function() {
      elapsed++;
      localStorage.setItem('elapsed', elapsed);
      updateTime();
    }, 1000);
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
    clearInterval(timerIntervalId);
    timerIntervalId = null;
    localStorage.removeItem('elapsed');
    localStorage.removeItem('isStart');
    localStorage.removeItem('task');
  };

  $('#task-name').change(function(e) {
    localStorage.setItem('task', e.target.value)
  });

  $(window).on('load', function() {
    if(localStorage.getItem('isStart')) {
      $('#task-name').val(localStorage.getItem('task'));
      console.log("test")
      // MeasurementElapsedTime();
    }
  });

  $(window).on('beforeunload', function(e) { 
    // timerIntervalId = null;
    // MeasurementElapsedTime();
  });

});