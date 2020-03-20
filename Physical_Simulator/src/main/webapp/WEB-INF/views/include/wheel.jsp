<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

	
	
			<div class="jumbotron" style="background-color: white; height: 400px; text-align: center;">
				
				<img src="<c:url value='/resources/pic/wheel.png'/>" id='wheel'>
	
				<script>

					$(function() {
						$('#FPS_slide').on('change', function(){
							var value = $('#FPS_slide').val();
							$('#FPS_value').text(value + 'FPS');
						});
	
						$('#Object_Speed_slide').on('change', function(){
							var value = $('#Object_Speed_slide').val();
							$('#Object_Speed_value').text(value + 'km/h');
						});
	
						$('#Radius_slide').on('change', function(){
							var value = $('#Radius_slide').val();
							$('#Radius_value').text(value + 'm');
						});
					});
					
					var wheel = document.getElementById('wheel');
			
					var degree = 0;
					var radius = 0.1;
					var speed = 1;
					var FPS = 1000/60;
					var stopInter;
					
					$(function() {
						$('#Object_Speed_slide, #Radius_slide, #FPS_slide').change(function() {
							speed = $('#Object_Speed_slide').val();
							radius = $('#Radius_slide').val();
							FPS = 1000 / $('#FPS_slide').val();
						});
					});
						
					var rotate = function() {
						
						degree = degree + (100 * speed) / (2 * Math.PI * radius);
						degree = degree%360
			
						wheel.style.transform = 'rotate(' + degree + 'deg)';	
					};
					
					function start(){
						clearInterval(stopInter);
						stopInter = setInterval(rotate, FPS);
					};
			
					function stop() {
						clearInterval(stopInter);
					};
			
				</script>
			</div>
			
			
			<!-- 데이터 조절 폼  -->
			
			
			<div class="form-group col-md-4">
				<div class="col-md-2" style="padding-left: 5px">FPS</div>
				<div class="col-md-4" style="padding-left: 10px">
					<font class="form-control" id="FPS_value" >60FPS</font>
				</div>
				
				<div class="col-md-6" style="padding-left: 10px">
					<input type="range" value="60" min="1" max="120" step="1" id="FPS_slide"/>
				</div>
			</div>
			
			
			<div class="form-group col-md-4">
				<div class="col-md-2" style="padding-left: 5px">Object Speed</div>
				<div class="col-md-4" style="padding-left: 10px">
					<font class="form-control" id="Object_Speed_value" >10km/h</font>
				</div>
				
				<div class="col-md-6" style="padding-left: 10px">
					<input type="range" value="1" min="1" max="100" step="1" id="Object_Speed_slide"/>
				</div>
			</div>
			
			<div class="form-group col-md-4">
				<div class="col-md-2" style="padding-left: 5px">Radius</div>
				<div class="col-md-4" style="padding-left: 10px">
					<font class="form-control" id="Radius_value" >1m</font>
				</div>
				
				<div class="col-md-6" style="padding-left: 10px">
					<input type="range" value="0.1" min="0.1" max="1" step="0.1" id="Radius_slide"/>
				</div>
			</div>
			
			<div class="form-group col-md-2 col-md-offset-10">
				<button type="button" class="btn btn-default btn-sm" onclick="start()">Start</button>
				<button type="button" class="btn btn-default btn-sm" onclick="stop()">Stop</button>
			</div>
			
			<h1>마차 바퀴 연상 (스트로보 효과)</h1>
			<div>
				마차 바퀴 현상(Wagon-wheel effect, 또는 역마차 바퀴 현상, 스트로보 효과)은 바큇살이 달린 바퀴가 실제 회전과 다르게 도는 것처럼 보이는 착시현상이다. 
				이때, 바퀴는 실제 회전보다 더 느리게 회전하는 것처럼 보일 수도 있고, 반대 방향으로 회전하는 것처럼 보일 수도 있다. 후자의 현상은 역회전 현상이라고 불리기도 한다.
				
				4개의 살이 달린 바퀴가 시계방향으로 회전한다고 상상해보자. 처음 바퀴가 보이는 순간은 하나의 살이 12시 방향에 있을 때일 것이다.
				만약 두 번째로 보이는 순간에 9시에 있던 살이 12시 방향으로 이동한다면, 관찰자는 바퀴가 움직이지 않았다고 인식할 것이다.
				만약 두 번째 순간에 다음 살이 11:30의 위치로 이동한다면, 관찰자는 바퀴가 거꾸로 회전한다고 인식할 것이다.
				만약 두 번째 순간에 다음 살이 12:30의 위치로 이동한다면, 관찰자는 바퀴가 실제 방향으로, 하지만 실제보다 느린 속도로 회전한다고 인식할 것이다.
				
				현상은 beta movement라고 불리는 운동 인지특성에 의존한다. 만약 물체들이 비슷하다면(각각의 살들은 서로 근본적으로 같으므로, 살이 달린 바퀴에서는 적용된다) 그리고 만약 물체들이 가깝다면(두 번째 순간에 원래 12시 위치에 있던 살보다 12시 위치에 가깝기에 원래 9시 위치에 있던 살에서는 적용된다) 다른 시각에 시야의 다른 위치에 있는 두 물체 사이에서 움직임이 보인다.
			</div>
	
	