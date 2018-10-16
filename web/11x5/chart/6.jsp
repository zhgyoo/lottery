<%@page contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
	<link rel="stylesheet" href="../../css/app.css" />
	<link href="//libs.baidu.com/fontawesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="../../lib/selection/selection.css" />
	<title></title>
</head>
<body id="chart-page">

<jsp:include page="../../menu.jsp" flush="true"></jsp:include>

<div id="master-module">
	<div id="navigation" class="clearfix">
		<h4>质合走势图</h4>
		<div class="toolbar-panel">
			<input id="11x5-type" class="lottery-type-field" value="SH11X5" title="上海11选5"/>
		</div>
	</div>
	<div class="module">
		<div id="chart-panel">
			<div id="detailed-panel">
			<table>
				<thead>
				<tr>
					<th rowspan="2" style="width:100px">期号</th>
					<th rowspan="2" colspan="5" style="width:125px">开奖号码</th>
					<th colspan="11" style="width:275px">开奖号码分布</th>
					<th colspan="2" style="width:60px">第一位</th>
					<th colspan="2" style="width:60px">第二位</th>
					<th colspan="2" style="width:60px">第三位</th>
					<th colspan="2" style="width:60px">第四位</th>
					<th colspan="2" style="width:60px">第五位</th>
					<th colspan="6" style="width:180px">质合比走势</th>
				</tr>
				<tr>
					<th>01</th>
					<th>02</th>
					<th>03</th>
					<th>04</th>
					<th>05</th>
					<th>06</th>
					<th>07</th>
					<th>08</th>
					<th>09</th>
					<th>10</th>
					<th>11</th>
					<th>质</th>
					<th>合</th>
					<th>质</th>
					<th>合</th>
					<th>质</th>
					<th>合</th>
					<th>质</th>
					<th>合</th>
					<th>质</th>
					<th>合</th>
					<th>0:5</th>
					<th>1:4</th>
					<th>2:3</th>
					<th>3:2</th>
					<th>4:1</th>
					<th>5:0</th>
				</tr>
				</thead>
				<tbody></tbody>
			</table>
			</div>
			<div id="statistics-panel">
			<table>
				<thead>
				<tr>
					<th rowspan="2" style="width:226px">统计类型</th>
					<th colspan="11" style="width:275px">开奖号码分布</th>
					<th colspan="2" style="width:60px">第一位</th>
					<th colspan="2" style="width:60px">第二位</th>
					<th colspan="2" style="width:60px">第三位</th>
					<th colspan="2" style="width:60px">第四位</th>
					<th colspan="2" style="width:60px">第五位</th>
					<th colspan="6" style="width:180px">质合比走势</th>
				</tr>
				<tr>
					<th>01</th>
					<th>02</th>
					<th>03</th>
					<th>04</th>
					<th>05</th>
					<th>06</th>
					<th>07</th>
					<th>08</th>
					<th>09</th>
					<th>10</th>
					<th>11</th>
					<th>质</th>
					<th>合</th>
					<th>质</th>
					<th>合</th>
					<th>质</th>
					<th>合</th>
					<th>质</th>
					<th>合</th>
					<th>质</th>
					<th>合</th>
					<th>0:5</th>
					<th>1:4</th>
					<th>2:3</th>
					<th>3:2</th>
					<th>4:1</th>
					<th>5:0</th>
				</tr>
				</thead>
				<tbody></tbody>
			</table>
			</div>
		</div>
	</div>
</div>
	<script src="../../lib/app.js"></script>
	<script src="../../lib/selection/selection.js"></script>
	
	<script type="text/javascript">
		
		$(function()
		{
			$("#11x5-type").selection
			({
				url: "../dictionary/list/type.json",
				ismultiple: false,
				clickitem:function()
				{
					initialise();
				}
			});
			initialise();
		});

		function initialise()
		{
			app.showLoading();
			$.getJSON("../service/data.jsp?mode=1&length=100&type="+$("#11x5-type").val(), function(response)
			{
				if(response.status == 1)
				{
					var rows = response.resource.data;
					var $detailed = $("#detailed-panel table tbody");
					var content = '';
					for(var i = 10 ; i < rows.length ; i++)
					{
						var row = rows[i];
						var codes = row["CODE"].split(",")
						content += '<tr>';
						content += '<td>'+row["PHASE"]+'</td>';
						content += '<td class="redcode">'+codes[0]+'</td>';
						content += '<td class="redcode">'+codes[1]+'</td>';
						content += '<td class="redcode">'+codes[2]+'</td>';
						content += '<td class="redcode">'+codes[3]+'</td>';
						content += '<td class="redcode">'+codes[4]+'</td>';


						content += '<td class="K01">'+(codes.indexOf('01') == -1 ? '' : '<span class="redball">01</span>')+'</td>';
						content += '<td class="K02">'+(codes.indexOf('02') == -1 ? '' : '<span class="redball">02</span>')+'</td>';
						content += '<td class="K03">'+(codes.indexOf('03') == -1 ? '' : '<span class="redball">03</span>')+'</td>';
						content += '<td class="K04">'+(codes.indexOf('04') == -1 ? '' : '<span class="redball">04</span>')+'</td>';
						content += '<td class="K05">'+(codes.indexOf('05') == -1 ? '' : '<span class="redball">05</span>')+'</td>';
						content += '<td class="K06">'+(codes.indexOf('06') == -1 ? '' : '<span class="redball">06</span>')+'</td>';
						content += '<td class="K07">'+(codes.indexOf('07') == -1 ? '' : '<span class="redball">07</span>')+'</td>';
						content += '<td class="K08">'+(codes.indexOf('08') == -1 ? '' : '<span class="redball">08</span>')+'</td>';
						content += '<td class="K09">'+(codes.indexOf('09') == -1 ? '' : '<span class="redball">09</span>')+'</td>';
						content += '<td class="K10">'+(codes.indexOf('10') == -1 ? '' : '<span class="redball">10</span>')+'</td>';
						content += '<td class="K11">'+(codes.indexOf('11') == -1 ? '' : '<span class="redball">11</span>')+'</td>';


						content += '<td class="D1">'+(app.isPrime(codes[0]) ? '<span class="greenrect">质</span>' : '')+'</td>';
						content += '<td class="X1">'+(!app.isPrime(codes[0]) ? '<span class="greenrect">合</span>' : '')+'</td>';
						content += '<td class="D2">'+(app.isPrime(codes[1]) ? '<span class="yellowrect">质</span>' : '')+'</td>';
						content += '<td class="X2">'+(!app.isPrime(codes[1]) ? '<span class="yellowrect">合</span>' : '')+'</td>';
						content += '<td class="D3">'+(app.isPrime(codes[2]) ? '<span class="bluerect">质</span>' : '')+'</td>';
						content += '<td class="X3">'+(!app.isPrime(codes[2]) ? '<span class="bluerect">合</span>' : '')+'</td>';
						content += '<td class="D4">'+(app.isPrime(codes[3]) ? '<span class="purplerect">质</span>' : '')+'</td>';
						content += '<td class="X4">'+(!app.isPrime(codes[3]) ? '<span class="purplerect">合</span>' : '')+'</td>';
						content += '<td class="D5">'+(app.isPrime(codes[4]) ? '<span class="seagreenrect">质</span>' : '')+'</td>';
						content += '<td class="X5">'+(!app.isPrime(codes[4]) ? '<span class="seagreenrect">合</span>' : '')+'</td>';

						var scount = 0;
						var bcount = 0;
						$.each(codes, function(i, code)
						{
							code = parseInt(code)
							if(app.isPrime(code))
							{
								bcount += 1;
							}
							else
							{
								scount += 1;
							}
						});

						var sb = bcount + ":" + scount;

						content += '<td class="B05">'+(sb == "0:5" ? '<span class="greenrect">0:5</span>' : '')+'</td>';
						content += '<td class="B14">'+(sb == "1:4" ? '<span class="greenrect">1:4</span>' : '')+'</td>';
						content += '<td class="B23">'+(sb == "2:3" ? '<span class="greenrect">2:3</span>' : '')+'</td>';
						content += '<td class="B32">'+(sb == "3:2" ? '<span class="greenrect">3:2</span>' : '')+'</td>';
						content += '<td class="B41">'+(sb == "4:1" ? '<span class="greenrect">4:1</span>' : '')+'</td>';
						content += '<td class="B50">'+(sb == "5:0" ? '<span class="greenrect">5:0</span>' : '')+'</td>';



						content += '</tr>';
					}
					$detailed.html(content);
					

					var $statistics = $("#statistics-panel table tbody");
					var tempstatisticsmap = {};
					var statisticsmap = {};
					var $rows = $detailed.find("tr");
					$.each($rows, function(i, row)
					{
						var $cells = $(row).find("td");
						$.each($cells, function(j, cell)
						{
							var $cell = $(cell);
							var classname = "L"+$cell.attr("class");
							var isBingo = ($cell.find("span").length != 0);

							if(tempstatisticsmap[classname] == null)
							{
								tempstatisticsmap[classname] = 0;
							}

							if(isBingo)
							{
								tempstatisticsmap[classname] += 1;
							}

							if(!isBingo || (i == $rows.length - 1))
							{
								statisticsmap[classname] = Math.max((statisticsmap[classname] || 0), (tempstatisticsmap[classname] || 0));
								tempstatisticsmap[classname] = 0;
							}

							classname = "Y"+$cell.attr("class");
							if(tempstatisticsmap[classname] == null)
							{
								tempstatisticsmap[classname] = 0;
							}

							if(!isBingo)
							{
								tempstatisticsmap[classname] += 1;
							}
							
							if(isBingo || (i == $rows.length - 1))
							{
								statisticsmap[classname] = Math.max((statisticsmap[classname] || 0), (tempstatisticsmap[classname] || 0));
								tempstatisticsmap[classname] = 0;
							}
						});
						
					});

					content = "";
					content += '<tr>';
					content += '<td>出现总次数</td>';
					content += '<td>'+($(".K01  span").length)+'</td>';
					content += '<td>'+($(".K02  span").length)+'</td>';
					content += '<td>'+($(".K03  span").length)+'</td>';
					content += '<td>'+($(".K04  span").length)+'</td>';
					content += '<td>'+($(".K05  span").length)+'</td>';
					content += '<td>'+($(".K06  span").length)+'</td>';
					content += '<td>'+($(".K07  span").length)+'</td>';
					content += '<td>'+($(".K08  span").length)+'</td>';
					content += '<td>'+($(".K09  span").length)+'</td>';
					content += '<td>'+($(".K10  span").length)+'</td>';
					content += '<td>'+($(".K11  span").length)+'</td>';
					content += '<td>'+($(".D1  span").length)+'</td>';
					content += '<td>'+($(".X1  span").length)+'</td>';
					content += '<td>'+($(".D2  span").length)+'</td>';
					content += '<td>'+($(".X2  span").length)+'</td>';
					content += '<td>'+($(".D3  span").length)+'</td>';
					content += '<td>'+($(".X3  span").length)+'</td>';
					content += '<td>'+($(".D4  span").length)+'</td>';
					content += '<td>'+($(".X4  span").length)+'</td>';
					content += '<td>'+($(".D5  span").length)+'</td>';
					content += '<td>'+($(".X5  span").length)+'</td>';
					content += '<td>'+($(".B05  span").length)+'</td>';
					content += '<td>'+($(".B14  span").length)+'</td>';
					content += '<td>'+($(".B23  span").length)+'</td>';
					content += '<td>'+($(".B32  span").length)+'</td>';
					content += '<td>'+($(".B41  span").length)+'</td>';
					content += '<td>'+($(".B50  span").length)+'</td>';
					content += '</tr>';

					content += '<tr class="bluerow">';
					content += '<td>最大遗漏值</td>';
					content += '<td>'+(statisticsmap["YK01"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YK02"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YK03"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YK04"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YK05"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YK06"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YK07"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YK08"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YK09"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YK10"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YK11"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YD1"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YX1"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YD2"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YX2"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YD3"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YX3"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YD4"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YX4"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YD5"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YX5"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YB05"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YB14"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YB23"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YB32"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YB41"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["YB50"] || 0)+'</td>';
					content += '</tr>';

					content += '<tr>';
					content += '<td>最大连出值</td>';
					content += '<td>'+(statisticsmap["LK01"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LK02"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LK03"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LK04"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LK05"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LK06"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LK07"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LK08"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LK09"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LK10"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LK11"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LD1"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LX1"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LD2"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LX2"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LD3"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LX3"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LD4"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LX4"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LD5"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LX5"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LB05"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LB14"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LB23"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LB32"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LB41"] || 0)+'</td>';
					content += '<td>'+(statisticsmap["LB50"] || 0)+'</td>';
					content += '</tr>';



					$statistics.html(content);
					app.hideLoading();


				}
				else
				{
					app.hideLoading();
					app.message(response.messages);
				}
			});
		}
	</script>

</body>
</html>
