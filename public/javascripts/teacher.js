$(function(){
$.getJSON("/public/javascripts/agile_carousel_data.php", function(data) {
    $(document).ready(function(){
        $("#flavor_1").agile_carousel({
            carousel_data: data,
            carousel_outer_height: 280,
            carousel_height: 280,
            slide_height: 280,
            carousel_outer_width: 750,
            slide_width: 750,
            transition_time: 300,
            timer: 4000,
            continuous_scrolling: true,
            control_set_1: "numbered_buttons",
            no_control_set: "hover_previous_button,hover_next_button"
        });
    });
});
})
function showTeacher(id){
	  var group = parseInt($("#teacherGroup").val());
	  $.ajax({
		  url:showTeacherAction(),
		  success:function(data){
			  $(".teacherDetail-img").animate({opacity:'-=0.4'},1000);
			  $(".name-area").animate({left:'+=150'},800).animate({left:'-=800'},1200);
			  setTimeout(function(){$(".message-area").animate({left:'+=150'},600).animate({left:'-=800'},1000)},500);
			  setTimeout(function(){$(".teacher-class-message").animate({left:'+=150'},800).animate({left:'-=1000'},700)},500);
			  setTimeout(function(){$(".sammmary-message").animate({left:'+=150'},500).animate({left:'-=800'},900,function(){
				  $(".main-contianer").html(data);
			  })},700);
		  },
		  data:{'id':id,'group':group},
		  dataType:'html',
		  type:'POST'
	  })
  }
function changeGroupTeacher(action){
	  var group = parseInt($("#teacherGroup").val());
	  var id = $("#teacherId").val();
	  if(action == 'pre'){
		  group = group -1;
	  }else if(action == 'next'){
		  group = group +1;
	  }
	  if(group < 1){
		  return false;
	  }
	  $.ajax({
		  url:changeGroupAction({'id':id,'group':group}),
		  success:function(data){
			  $(".teacherDetail-footarea").html(data);
		  },
		  dataType:'html',
		  type:'POST'
	  })
  }
function changePageDivided(form,action){
	$("#pageAction").val(action);
	$("#"+form).submit();

}
function setValue(form,target,value){
	$("input[name="+target+"][type=hidden]").val(value);
	$("#"+form).submit();
}
function ajaxSubForm(form,container){
	$form = $("#"+form);
	 $.ajax({
		  url:$form.attr("action"),
		  success:function(data){
			$("."+container).html(data);
		  },
		  data:$form.serializeArray(),
		  cache: false,
		  dataType:'html',
		  type:'POST'
	  });
	  return false;
}
function scollDiv(listObj,moveObj,speed,isSeries,direct,steplength){
	
	var pos,left,aniLeft,width;
	pos = listObj.position();
	left = pos.left;
	aniLeft = left;			
	width = listObj.width();
	var id = '';  //记录setInterval的标记id
	var scrollUp = function() {
		aniLeft -= steplength;
		if(direct == 'left'){
			if(!isSeries) {	//isSeries变量控制是否连续滚动，false不连续，true连续
				listObj.animate({left:'-='+left},speed,function(){
					if(aniLeft < -width) {	//不连续，滚动玩重新滚动
						listObj.css({'left': left});
						aniLeft = left;
					};
				})
				
			} else {
				var marginLeft = listObj.children().eq(0).css("marginLeft");
				marginLeft = parseInt(marginLeft.substring(0,marginLeft.length-2)); 
				var marginRight = listObj.children().eq(0).css("marginRight");
				marginRight = parseInt(marginRight.substring(0,marginRight.length-2)); 
				var margin = marginLeft+marginRight;
				listObj.animate({left:'-='+steplength},500,function(){
					if(aniLeft < (-listObj.children().eq(0).width()-margin)) {	//连续滚动
						var firstItem = listObj.children().eq(0);
						listObj.append(firstItem);
						//listObj.children().eq(0).remove();
						aniLeft = 0;
					};
					listObj.css({'left': aniLeft + 'px'});
				});

			};
		}else if(direct == 'top'){
			left = pos.top;
			aniLeft = left;			
			width = listObj.height();
			if(!isSeries) {	//isSeries变量控制是否连续滚动，false不连续，true连续
				listObj.animate({top:'-='+left},speed,function(){
					if(aniLeft < -width) {	//不连续，滚动玩重新滚动
						listObj.css({'top': left});
						aniLeft = left;
					};
				})
				
			} else {
				var marginLeft = listObj.children().eq(0).css("marginTop");
				marginLeft = parseInt(marginLeft.substring(0,marginLeft.length-2)); 
				var marginRight = listObj.children().eq(0).css("marginBottom");
				marginRight = parseInt(marginRight.substring(0,marginRight.length-2)); 
				var margin = marginLeft+marginRight;
				listObj.animate({top:'-='+steplength},500,function(){
					if(aniLeft < (-listObj.children().eq(0).height()-margin)) {	//连续滚动
						var firstItem = listObj.children().eq(0);
						listObj.append(firstItem);
						//listObj.children().eq(0).remove();
						aniLeft = 0;
					};
					listObj.css({'top': aniLeft + 'px'});
				});

			};
		}
		
	};
	var hover = function(id) {
		listObj.hover(function() {
			clearInterval(id);
		}, function() {
			id = setInterval(scrollUp, speed);
		});
	};

	this.start = function() {
		id = setInterval(scrollUp, speed);
		hover(id);
	};
}