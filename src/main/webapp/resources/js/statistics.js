
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawBasic);

function drawBasic(data1) {

	var dataTable = google.visualization.arrayToDataTable(data1);
	
	var options = {
	  title: '',
	  fontSize : 12,
	  hAxis: {
	    title: '',
	    format: 'h:mm a',
	    viewWindow: {
	      min: [7, 30, 0],
	      max: [17, 50, 0]
	    }
	  },
	  vAxis: {
	    title: '',
	  }
	};

      var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
      chart.draw(dataTable, options);
}

$(window).on('load',function () {
	cateBring();
});

var arr = [];

function cateBring(){
	$.ajax({
        url : "bringStatistics",
        success : function(data) {
        	for(i=0; i<data.length; i++){
        		var a = {s_name : data[i].s_name, s_num : data[i].s_num};
        		arr.push(a);
        	}
        	var data1 = [['Element', '(단위: 만)', { role: 'style', color: '#FFE98C' }]];
        	for (var i = 0; i < arr.length; i++) {
        	  var category = arr[i].s_name;
        	  var value = arr[i].s_num;
        	  data1.push([category, value, '#FFE98C']);
        	}        	
        	drawBasic(data1);
        }
	})
}
