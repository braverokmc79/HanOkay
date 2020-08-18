<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<style>
		a{
			color: #21292d !important;
		}
	</style>	

	<%@include file="../../includes/adminheader.jsp"%>


	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<!-- 사업자 등록도 받을것 -->

			<ul class="nav" id="side-menu">
				<li>
					<a href="/admin/stats/statsChart"><i class="fa fa-camera fa-fw"></i> 한눈에 보기</a>
				</li>
				<li>
					<a href="/admin/stats/statsRank"><i class="fa fa-arrow-circle-up"></i> 숙소 랭킹</a>
				</li>
				<li>
					<a href="/admin/stats/stats"><i class="fa fa-krw fa-fw"></i> 매출 </a>
				</li>
				
			</ul>

		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
	<!-- nav-end -->
	<div id="page-wrapper" style="padding-bottom:50px;margin-left: 0px;">
		<div class=" containerMR">
		<h1>매출 및 통계 현황</h1>
		<h3></h3>
		
		<div class="wrapper">
		    <div class="counter col_fourth">
		      <i class="fa fa-won fa-2x" style="color:#c93546 !important;"></i>
		      <h2 class="timer count-title count-number" data-to="${beforeMonthSum }" data-speed="1500">원</h2>
		       <p class="count-text ">최근 한달 매출액</p>
		    </div>
		
		    <div class="counter col_fourth">
		      <i class="fa fa-pencil-square-o fa-2x" style="color:#c93546 !important;"></i>
		      <h2 class="timer count-title count-number" data-to="${beforeMonthCount }" data-speed="1500"></h2>
		      <p class="count-text ">최근 한달 예약 건수</p>
		    </div>
			<div class="counter col_fourth end">
		      <i class="fa  fa-bar-chart fa-2x" style="color:#c93546 !important;"></i>
		      <h2 class="timer count-title count-number" data-to="${todaysum }" data-speed="1500"></h2>
		      <p class="count-text ">오늘 매출액</p>
		    </div>
		    <div class="counter col_fourth end">
		      <i class="fa  fa-bar-chart fa-2x" style="color:#c93546 !important;"></i>
		      <h2 class="timer count-title count-number" data-to="${count }" data-speed="1500"></h2>
		      <p class="count-text ">누적 예약수</p>
		    </div>
		</div>
			<div class="chartArea">
				<div id="doughnutChart" class="chart"><h4>숙소별 매출 분포도 </h4></div>
			</div>
			
			</div>
</div>
<script src="//cdnjs.cloudflare.com/ajax/libs/numeral.js/2.0.6/numeral.min.js"></script>
<script type="text/javascript">
	var colorArr = ['#c89791','#e25d75','#eccbd0','#944847','#9a5bc','#c93546','#d03957','#c79199','#f7cac2',
		'#775062','#fbedea','#c79199','#d2a7b0','#7a6d81','#7c5b5a','#f5d4cb','#d45b41','#fa8a5f','#f7ab89',
		'#c89791','#e25d75','#eccbd0','#944847','#9a5bc','#c93546','#d03957','#c79199','#f7cac2',
		'#775062','#fbedea','#c79199','#d2a7b0','#7a6d81','#7c5b5a','#f5d4cb','#d45b41','#fa8a5f','#f7ab89',
		'#c89791','#e25d75','#eccbd0','#944847','#9a5bc','#c93546','#d03957','#c79199','#f7cac2',
		'#775062','#fbedea','#c79199','#d2a7b0','#7a6d81','#7c5b5a','#f5d4cb','#d45b41','#fa8a5f','#f7ab89',
		'#5c1513','#a7121d','#c62139']
	
$(function(){
	  $("#doughnutChart").drawDoughnutChart([
		  
		  <c:forEach items="${list}" var="list">
		  
		  { title: "<c:out value='${list.acmName}' />", value : <c:out value="${list.sumTotal}" />,color:colorArr[Math.round(Math.random() *64)] },
		  </c:forEach>
	  ]);
	});
	;(function($, undefined) {
	  $.fn.drawDoughnutChart = function(data, options) {
	    var $this = this,
	      W = $this.width(),
	      H = $this.height(),
	      centerX = W/2,
	      centerY = H/2,
	      cos = Math.cos,
	      sin = Math.sin,
	      PI = Math.PI,
	      settings = $.extend({
	        segmentShowStroke : true,
	        segmentStrokeColor : "#0C1013",
	        segmentStrokeWidth : 1,
	        baseColor: "rgba(0,0,0,0.5)",
	        baseOffset: 4,
	        edgeOffset : 10,//offset from edge of $this
	        percentageInnerCutout : 75,
	        animation : true,
	        animationSteps : 90,
	        animationEasing : "easeInOutExpo",
	        animateRotate : true,
	        tipOffsetX: -8,
	        tipOffsetY: -45,
	        tipClass: "doughnutTip",
	        summaryClass: "doughnutSummary",
	        summaryTitle: "총 수익",
	        summaryTitleClass: "doughnutSummaryTitle",
	        summaryNumberClass: "doughnutSummaryNumber",
	        beforeDraw: function() {  },
	        afterDrawed : function() {  },
	        onPathEnter : function(e,data) {  },
	        onPathLeave : function(e,data) {  }
	      }, options),
	      animationOptions = {
	        linear : function (t) {
	          return t;
	        },
	        easeInOutExpo: function (t) {
	          var v = t<.5 ? 8*t*t*t*t : 1-8*(--t)*t*t*t;
	          return (v>1) ? 1 : v;
	        }
	      },
	      requestAnimFrame = function() {
	        return window.requestAnimationFrame ||
	          window.webkitRequestAnimationFrame ||
	          window.mozRequestAnimationFrame ||
	          window.oRequestAnimationFrame ||
	          window.msRequestAnimationFrame ||
	          function(callback) {
	            window.setTimeout(callback, 1000 / 60);
	          };
	      }();

	    settings.beforeDraw.call($this);

	    var $svg = $('<svg width="' + W + '" height="' + H + '" viewBox="0 0 ' + W + ' ' + H + '" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"></svg>').appendTo($this),
	        $paths = [],
	        easingFunction = animationOptions[settings.animationEasing],
	        doughnutRadius = Min([H / 2,W / 2]) - settings.edgeOffset,
	        cutoutRadius = doughnutRadius * (settings.percentageInnerCutout / 100),
	        segmentTotal = 0;

	    //Draw base doughnut
	    var baseDoughnutRadius = doughnutRadius + settings.baseOffset,
	        baseCutoutRadius = cutoutRadius - settings.baseOffset;
	    $(document.createElementNS('http://www.w3.org/2000/svg', 'path'))
	      .attr({
	        "d": getHollowCirclePath(baseDoughnutRadius, baseCutoutRadius),
	        "fill": settings.baseColor
	      })
	      .appendTo($svg);

	    //Set up pie segments wrapper
	    var $pathGroup = $(document.createElementNS('http://www.w3.org/2000/svg', 'g'));
	    $pathGroup.attr({opacity: 0}).appendTo($svg);

	    //Set up tooltip
	    var $tip = $('<div class="' + settings.tipClass + '" />').appendTo('body').hide(),
	        tipW = $tip.width(),
	        tipH = $tip.height();

	    //Set up center text area
	    var summarySize = (cutoutRadius - (doughnutRadius - cutoutRadius)) * 2,
	        $summary = $('<div class="' + settings.summaryClass + '" />')
	                   .appendTo($this)
	                   .css({ 
	                     width: summarySize + "px",
	                     height: summarySize + "px",
	                     "margin-left": -(summarySize / 2) + "px",
	                     "margin-top": -(summarySize / 2) + "px"
	                   });
	    var $summaryTitle = $('<p class="' + settings.summaryTitleClass + '">' + settings.summaryTitle + '</p>').appendTo($summary);
	    var $summaryNumber = $('<p class="' + settings.summaryNumberClass + '"></p>').appendTo($summary).css({opacity: 0});

	    for (var i = 0, len = data.length; i < len; i++) {
	      segmentTotal += data[i].value;
	      $paths[i] = $(document.createElementNS('http://www.w3.org/2000/svg', 'path'))
	        .attr({
	          "stroke-width": settings.segmentStrokeWidth,
	          "stroke": settings.segmentStrokeColor,
	          "fill": data[i].color,
	          "data-order": i
	        })
	        .appendTo($pathGroup)
	        .on("mouseenter", pathMouseEnter)
	        .on("mouseleave", pathMouseLeave)
	        .on("mousemove", pathMouseMove);
	    }

	    //Animation start
	    animationLoop(drawPieSegments);

	    //Functions
	    function getHollowCirclePath(doughnutRadius, cutoutRadius) {
	        //Calculate values for the path.
	        //We needn't calculate startRadius, segmentAngle and endRadius, because base doughnut doesn't animate.
	        var startRadius = -1.570,// -Math.PI/2
	            segmentAngle = 6.2831,// 1 * ((99.9999/100) * (PI*2)),
	            endRadius = 4.7131,// startRadius + segmentAngle
	            startX = centerX + cos(startRadius) * doughnutRadius,
	            startY = centerY + sin(startRadius) * doughnutRadius,
	            endX2 = centerX + cos(startRadius) * cutoutRadius,
	            endY2 = centerY + sin(startRadius) * cutoutRadius,
	            endX = centerX + cos(endRadius) * doughnutRadius,
	            endY = centerY + sin(endRadius) * doughnutRadius,
	            startX2 = centerX + cos(endRadius) * cutoutRadius,
	            startY2 = centerY + sin(endRadius) * cutoutRadius;
	        var cmd = [
	          'M', startX, startY,
	          'A', doughnutRadius, doughnutRadius, 0, 1, 1, endX, endY,//Draw outer circle
	          'Z',//Close path
	          'M', startX2, startY2,//Move pointer
	          'A', cutoutRadius, cutoutRadius, 0, 1, 0, endX2, endY2,//Draw inner circle
	          'Z'
	        ];
	        cmd = cmd.join(' ');
	        return cmd;
	    };
	    function pathMouseEnter(e) {
	      var order = $(this).data().order;
	      $tip.text(data[order].title + ": " + numeral(data[order].value).format('0,0')+"원")
	          .fadeIn(200);
	      settings.onPathEnter.apply($(this),[e,data]);
	    }
	    function pathMouseLeave(e) {
	      $tip.hide();
	      settings.onPathLeave.apply($(this),[e,data]);
	    }
	    function pathMouseMove(e) {
	      $tip.css({
	        top: e.pageY + settings.tipOffsetY,
	        left: e.pageX - $tip.width() / 2 + settings.tipOffsetX
	      });
	    }
	    function drawPieSegments (animationDecimal) {
	      var startRadius = -PI / 2, //-90 degree
	          rotateAnimation = 1;
	      if (settings.animation && settings.animateRotate) rotateAnimation = animationDecimal;//count up between0~1

	      drawDoughnutText(animationDecimal, segmentTotal);

	      $pathGroup.attr("opacity", animationDecimal);

	      //If data have only one value, we draw hollow circle(#1).
	      if (data.length === 1 && (4.7122 < (rotateAnimation * ((data[0].value / segmentTotal) * (PI * 2)) + startRadius))) {
	        $paths[0].attr("d", getHollowCirclePath(doughnutRadius, cutoutRadius));
	        return;
	      }
	      for (var i = 0, len = data.length; i < len; i++) {
	        var segmentAngle = rotateAnimation * ((data[i].value / segmentTotal) * (PI * 2)),
	            endRadius = startRadius + segmentAngle,
	            largeArc = ((endRadius - startRadius) % (PI * 2)) > PI ? 1 : 0,
	            startX = centerX + cos(startRadius) * doughnutRadius,
	            startY = centerY + sin(startRadius) * doughnutRadius,
	            endX2 = centerX + cos(startRadius) * cutoutRadius,
	            endY2 = centerY + sin(startRadius) * cutoutRadius,
	            endX = centerX + cos(endRadius) * doughnutRadius,
	            endY = centerY + sin(endRadius) * doughnutRadius,
	            startX2 = centerX + cos(endRadius) * cutoutRadius,
	            startY2 = centerY + sin(endRadius) * cutoutRadius;
	        var cmd = [
	          'M', startX, startY,//Move pointer
	          'A', doughnutRadius, doughnutRadius, 0, largeArc, 1, endX, endY,//Draw outer arc path
	          'L', startX2, startY2,//Draw line path(this line connects outer and innner arc paths)
	          'A', cutoutRadius, cutoutRadius, 0, largeArc, 0, endX2, endY2,//Draw inner arc path
	          'Z'//Cloth path
	        ];
	        $paths[i].attr("d", cmd.join(' '));
	        startRadius += segmentAngle;
	      }
	    }
	    function drawDoughnutText(animationDecimal, segmentTotal) {
	      $summaryNumber
	        .css({opacity: animationDecimal})
	        .text((segmentTotal * animationDecimal).toFixed(1));
	    }
	    function animateFrame(cnt, drawData) {
	      var easeAdjustedAnimationPercent =(settings.animation)? CapValue(easingFunction(cnt), null, 0) : 1;
	      drawData(easeAdjustedAnimationPercent);
	    }
	    function animationLoop(drawData) {
	      var animFrameAmount = (settings.animation)? 1 / CapValue(settings.animationSteps, Number.MAX_VALUE, 1) : 1,
	          cnt =(settings.animation)? 0 : 1;
	      requestAnimFrame(function() {
	          cnt += animFrameAmount;
	          animateFrame(cnt, drawData);
	          if (cnt <= 1) {
	            requestAnimFrame(arguments.callee);
	          } else {
	            settings.afterDrawed.call($this);
	          }
	      });
	    }
	    function Max(arr) {
	      return Math.max.apply(null, arr);
	    }
	    function Min(arr) {
	      return Math.min.apply(null, arr);
	    }
	    function isNumber(n) {
	      return !isNaN(parseFloat(n)) && isFinite(n);
	    }
	    function CapValue(valueToCap, maxValue, minValue) {
	      if (isNumber(maxValue) && valueToCap > maxValue) return maxValue;
	      if (isNumber(minValue) && valueToCap < minValue) return minValue;
	      return valueToCap;
	    }
	    return $this;
	  };
	})(jQuery);

	
	//다른 부분
	
	(function ($) {
	$.fn.countTo = function (options) {
		options = options || {};
		
		return $(this).each(function () {
			// set options for current element
			var settings = $.extend({}, $.fn.countTo.defaults, {
				from:            $(this).data('from'),
				to:              $(this).data('to'),
				speed:           $(this).data('speed'),
				refreshInterval: $(this).data('refresh-interval'),
				decimals:        $(this).data('decimals')
			}, options);
			
			// how many times to update the value, and how much to increment the value on each update
			var loops = (settings.speed / settings.refreshInterval),
				increment = (settings.to - settings.from) / loops;
			
			// references & variables that will change with each update
			var self = this,
				$self = $(this),
				loopCount = 0,
				value = settings.from,
				data = $self.data('countTo') || {};
			
			$self.data('countTo', data);
			
			// if an existing interval can be found, clear it first
			if (data.interval) {
				clearInterval(data.interval);
			}
			data.interval = setInterval(updateTimer, settings.refreshInterval);
			
			// initialize the element with the starting value
			render(value);
			
			function updateTimer() {
				value += increment;
				loopCount++;
				
				render(value);
				
				if (typeof(settings.onUpdate) == 'function') {
					settings.onUpdate.call(self, value);
				}
				
				if (loopCount >= loops) {
					// remove the interval
					$self.removeData('countTo');
					clearInterval(data.interval);
					value = settings.to;
					
					if (typeof(settings.onComplete) == 'function') {
						settings.onComplete.call(self, value);
					}
				}
			}
			
			function render(value) {
				var formattedValue = settings.formatter.call(self, value, settings);
				$self.html(formattedValue);
			}
		});
	};
	
	$.fn.countTo.defaults = {
		from: 0,               // the number the element should start at
		to: 0,                 // the number the element should end at
		speed: 1000,           // how long it should take to count between the target numbers
		refreshInterval: 100,  // how often the element should be updated
		decimals: 0,           // the number of decimal places to show
		formatter: formatter,  // handler for formatting the value before rendering
		onUpdate: null,        // callback method for every time the element is updated
		onComplete: null       // callback method for when the element finishes updating
	};
	
	function formatter(value, settings) {
		return value.toFixed(settings.decimals);
	}
}(jQuery));

jQuery(function ($) {
  // custom formatting example
  $('.count-number').data('countToOptions', {
	formatter: function (value, options) {
	  return value.toFixed(options.decimals).replace(/\B(?=(?:\d{3})+(?!\d))/g, ',');
	}
  });
  
  // start all the timers
  $('.timer').each(count);  
  
  function count(options) {
	var $this = $(this);
	options = $.extend({}, options || {}, $this.data('countToOptions') || {});
	$this.countTo(options);
  }
});
</script>
<%@include file="../../includes/footer.jsp"%>
