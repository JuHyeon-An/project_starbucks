const width_threshold = 480;

function drawLineChart() {
	  if ($("#lineChart").length) {
	    ctxLine = document.getElementById("lineChart").getContext("2d");
	    optionsLine = {
	    	responsive : true, 
	      scales: {
	        yAxes: [
	        	{
	          	  type: 'linear',
	                display: true,
	                labelString: "매출",
	                position : 'left',
	                id : 'a',
	                  beginAtZero : true,
	                  ticks: {
	                      max: 2000000,
	                      min: 0,
	                      stepSize: 500000
	                  }
	            },
	            {
	          	  type: 'linear',
	                  display: true,
	                  labelString: "회원가입",
	                  position : 'right',
	                  id : 'b',
	                  beginAtZero : true,
	                  ticks: {
	                      max: 100,
	                      min: 0,
	                      stepSize: 10
	                  }
	                
	              }
	        ]
	      }
	    };

	    // Set aspect ratio based on window width
	    optionsLine.maintainAspectRatio =
	      $(window).width() < width_threshold ? false : true;

	    configLine = {
	      type: "line",
	      data: {
	        labels: [
	        	 "19년 10월",
	             "11월",
	             "12월",
	             "20년 1월",
	             "2월",
	             "3월",
	             "4월"
	        ],
	        datasets: [
	          {
	            label: "월별매출액",
	            data: [sumArray[0].value, sumArray[1].value, sumArray[2].value, 
	            	   sumArray[3].value, sumArray[4].value, sumArray[5].value, sumArray[6].value], //각 월별 매출액 넣으면 됨,
	            fill: true,
	            borderColor: "rgb(75, 192, 192)",
	            cubicInterpolationMode: "monotone",
	            pointRadius: 3,
	            yAxisID: 'a'
	          },
	          {
	            label: "회원가입수",
	            data: [33, 45, 37, 21, 55, 74, 69],
	            fill: true,
	            borderColor: "rgba(255,99,132,1)",
	            cubicInterpolationMode: "monotone",
	            pointRadius: 3,
	            yAxisID: 'b'
	          },
	        ]
	      },
	      options: optionsLine
	    };

	    lineChart = new Chart(ctxLine, configLine);
	  }
	}


function drawBarChart() {
  if ($("#barChart").length) {
    ctxBar = document.getElementById("barChart").getContext("2d");

    optionsBar = {
      responsive: true,
      scales: {
        yAxes: [
          {
            barPercentage: 0.2,
            ticks: {
              beginAtZero: true
            },
            scaleLabel: {
              display: true
            }
          }
        ]
      }
    };

    optionsBar.maintainAspectRatio =
      $(window).width() < width_threshold ? false : true;

    /**
     * COLOR CODES
     * Red: #F7604D
     * Aqua: #4ED6B8
     * Green: #A8D582
     * Yellow: #D7D768
     * Purple: #9D66CC
     * Orange: #DB9C3F
     * Blue: #3889FC
     */

    configBar = {
      type: "horizontalBar",
      data: {
    	  
        labels: [array[0].value, array[1].value, array[2].value, array[3].value, 
        	array[4].value, array[5].value, array[6].value],
        datasets: [
          {
            label: "판매량",
            data: [arrayValue[0].value, arrayValue[1].value, arrayValue[2].value, arrayValue[3].value, 
            	arrayValue[4].value, arrayValue[5].value, arrayValue[6].value],
            backgroundColor: [
              "#F7604D",
              "#4ED6B8",
              "#A8D582",
              "#D7D768",
              "#9D66CC",
              "#DB9C3F",
              "#3889FC"
            ],
            borderColor : [
            	 "#F7604D",
                 "#4ED6B8",
                 "#A8D582",
                 "#D7D768",
                 "#9D66CC",
                 "#DB9C3F",
                 "#3889FC"
            ],
            borderWidth: 0
          }
        ]
      }
    };

    barChart = new Chart(ctxBar, configBar);
  }
}

function drawPieChart() {
  if ($("#pieChart").length) {
    var chartHeight = 300;

    $("#pieChartContainer").css("height", chartHeight + "px");

    ctxPie = document.getElementById("pieChart").getContext("2d");

    optionsPie = {
      responsive: true,
      maintainAspectRatio: false,
      layout: {
        padding: {
          left: 0,
          right: 0,
          top: 0,
          bottom: 0
        }
      },
      legend: {
        position: "bottom"
      }
    };

    configPie = {
      type: "pie",
      data: {
        datasets: [
          {
            data: [themeValue[0].value, themeValue[1].value, themeValue[2].value, themeValue[3].value],
            backgroundColor: ["#F7604D", "#4ED6B8", "#A8D582", "#DB9C3F"],
            label: "theme"
          }
        ],
        labels: [
        	themeArray[0].value,
        	themeArray[1].value,
        	themeArray[2].value,
        	themeArray[3].value
        ]
      },
      options: optionsPie
    };

    pieChart = new Chart(ctxPie, configPie);
  }
}

function updateLineChart() {
  if (lineChart) {
    lineChart.options = optionsLine;
    lineChart.update();
  }
}

function updateBarChart() {
  if (barChart) {
    barChart.options = optionsBar;
    barChart.update();
  }
}
