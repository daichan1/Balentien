$(function() {
  $('#date-filter').change(function(event) {
    const date = event.target.value.match(/[0-9]+/g);
    if (date == null) { return; }
    const year = date[0]
    const month = date[1]

    const a = document.createElement('a');
    a.href = `/diary?year=${year}&month=${month}`;
    a.click();
  });
});