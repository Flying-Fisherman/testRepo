<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	
	
	<div class="jumbotron" style="background-color: white; height: 400px; text-align: center; position: relative;">
		<div class="container">
				<canvas width="1020" height="400" style="position: absolute; left: 0px; top: 0px;" id="measure" ></canvas>
				<img src="<c:url value='/resources/pic/bal1NN.png'/>" id='gun' style="transform-origin: 50% 100%; z-index: 10">
				<%-- <img src="<c:url value='/resources/pic/bal2.png'/>" style="position: absolute; left: 10px; bottom: 10px"> --%>
				<img src="<c:url value='/resources/pic/bal3.png'/>" id='shell' style="z-index: 1; transform-origin: 50% 100%;">
	
				<script>

				var c = document.getElementById('measure');
				var ctx = c.getContext('2d');

				

					$(function() {
						$('#FPS_slide').on('change', function(){
							var value = $('#FPS_slide').val();
							$('#FPS_value').text(value + 'FPS');
						});
	
						$('#Object_Speed_slide').on('change', function(){
							var value = $('#Object_Speed_slide').val();
							$('#Object_Speed_value').text(value + 'm/s');
						});
	
						$('#Degree_slide').on('change', function(){
							var value = $('#Degree_slide').val();
							$('#Degree_value').text(value + 'º');
						});
					});
					
					var gun = document.getElementById('gun');
					var shell = document.getElementById('shell');
					gun.style.position = 'absolute';
					gun.style.left = 10 + 'px';
					gun.style.bottom = 20 + 'px';
					
					shell.style.position = 'absolute';
					shell.style.left = 13 + 'px';
					shell.style.bottom = 20 + 'px';
					
					
			
					var degree = 1;
					var degreeOrg = 1;
					gun.style.transform = 'rotate(' + 89 + 'deg)';
					shell.style.transform = 'rotate(' + 89 + 'deg)';
					var speed = 10;
					var speedV, speedH, distV, distH;
					var gravity = 9.8;
					var FPS = 1000/60;
					var time = FPS / 1000
					var stopInter;
					
					$(function() {
						$('#Object_Speed_slide, #Degree_slide, #FPS_slide').change(function() {
							degree = 90 - $('#Degree_slide').val();
							degreeOrg = $('#Degree_slide').val();
							gun.style.transform = 'rotate(' + degree + 'deg)';
							shell.style.transform = 'rotate(' + degree + 'deg)';

							
							speed = $('#Object_Speed_slide').val();
							
							
							
							FPS = 1000 / $('#FPS_slide').val();
						});
					});
						
					var shoot = function() {

						
						speed = $('#Object_Speed_slide').val();
						degree = 90 - $('#Degree_slide').val();
						degreeOrg = $('#Degree_slide').val();
						speedV, speedH, distV, distH = 0;


						
						time += FPS / 1000;
						speedV = speed * Math.cos(degreeOrg * Math.PI / 180);
						speedH = speed * Math.sin(degreeOrg * Math.PI / 180) - (9.8 * time);
						
						distV = speedV * time;
						distH = (speedH * time) - (0.5 * 9.8 * time * time);

						shell.style.left = 13 + distV + 'px';
						shell.style.bottom = 20 + distH +  'px';

						

						if(distH <= 0) {
							clearInterval(stopInter);
							measure(distV, distH);
							
						}	
					};
					
					function start(){
						time = 0;
						shell.style.left = 13 + 'px';
						shell.style.bottom = 20 + 'px';
						clearInterval(stopInter);
						stopInter = setInterval(shoot, FPS);
					};
			
					function stop() {
						clearInterval(stopInter);
					};

					/* 이 밑은 아직 미구현......... */
					
					/* function(dist, high) {
						for(var i = 0 ; i < 1020 ; i++) {
							
						}
					}; */

					/* var measure = function(dist, high) {
						ctx.moveTo(13, 400 - 20);
						ctx.lineTo(dist, 380 - high);
						ctx.stroke();
					}; */
			
				</script>
				</div>
			</div>
			
			
			<!-- 데이터 조절 폼  -->
			
			
			<div class="form-group col-md-4">
				<div class="col-md-2" style="padding-left: 5px">FPS</div>
				<div class="col-md-4" style="padding-left: 10px">
					<font class="form-control" id="FPS_value" >60FPS</font>
				</div>
				
				<div class="col-md-6" style="padding-left: 10px">
					<input type="range" value="60" min="5" max="120" step="1" id="FPS_slide"/>
				</div>
			</div>
			
			
			<div class="form-group col-md-4">
				<div class="col-md-2" style="padding-left: 5px">Object Speed</div>
				<div class="col-md-4" style="padding-left: 10px">
					<font class="form-control" id="Object_Speed_value" >10m/s</font>
				</div>
				
				<div class="col-md-6" style="padding-left: 10px">
					<input type="range" value="1" min="1" max="170" step="1" id="Object_Speed_slide"/>
				</div>
			</div>
			
			<div class="form-group col-md-4">
				<div class="col-md-2" style="padding-left: 5px">Degree</div>
				<div class="col-md-4" style="padding-left: 10px">
					<font class="form-control" id="Degree_value" >1º</font>
				</div>
				
				<div class="col-md-6" style="padding-left: 10px">
					<input type="range" value="1" min="1" max="90" step="1" id="Degree_slide"/>
				</div>
			</div>
			
			<div class="form-group col-md-2 col-md-offset-10">
				<button type="button" class="btn btn-default btn-sm" onclick="start()">Start</button>
				<button type="button" class="btn btn-default btn-sm" onclick="stop()">Stop</button>
			</div>
			
			<h1>탄도학(Ballistic)</h1>
			<div>
				탄도학(彈道學)은 총포탄, 미사일 등 비상체(탄체)가 물리적인 힘이나 화약에 의해 가속돼서 최종 목표에 도달하기까지의 운동과 그 운동에 영향을 끼치는 요인들을 조사하는 학문이다.
				탄도학은 무기의 발달에 따라 요구되는 비상체의 운동의 역학적 분석에 의해 점차 발달했다. 현재까지는 화약폭발에 의해 일어나는 복잡한 기류, 그로 인해 일어나는 강외에서 일어나는 공기역학적인 매우 복잡한 모든 현상 등을 미적분학과 물리학으로 분석하여 비상체가 목표지점에 도달할 수 있도록 하는 연구가 주를 이뤘으나,
				 최근에 인공위성과 같은 우주비상체가 탄생함으로써 이것에 대한 궤도를 분석하는 일까지 탄도학이라 불린다.
				
				가장 먼저 알려진 비상체는 돌과 창, 그리고 호주의 부메랑이었다. 화살을 쏘는 활의 사용은 약 1만년전으로 거슬러 올라가며 남아프리카 공화국의 Sibudu 동굴에서 그 흔적을 찾을수 있다고 한다. 지금까지 회수 된 가장 오래된 활은 덴마크의 Holmegård 늪에서 발견되었고, 약 8000년이 된것으로 추정된다고 한다. 
				총으로 확인된 최초의 기기는 서기 1000년 쯤에 중국에 등장, 그리고 12세기에 기술이 아시아 지역으로 퍼지게 되었고, 13세기에 유럽으로 전파되었다. 총이 점차 발달함에 따라 로켓의 기술 또한 개발되는데, 현대의 액체연료 로켓은 1926년 3월 16일 미국의 '로버트 고더드'가 처음으로 개발하였다.
			</div>
			
			
			
			
			
			
			
			
			
			
	