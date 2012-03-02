function showTeacher(id){
	  var group = parseInt($("#teacherGroup").val());
	  $.ajax({
		  url:showTeacherAction({'id':id,'group':group}),
		  success:function(data){
			  $(".teacherDetail-img").animate({opacity:'-=0.4'},1000);
			  $(".name-area").animate({left:'+=150'},1000).animate({left:'-=800'},1500);
			  setTimeout(function(){$(".message-area").animate({left:'+=150'},600).animate({left:'-=800'},1200)},500);
			  setTimeout(function(){$(".teacher-class-message").animate({left:'+=150'},800).animate({left:'-=1000'},1000)},500);
			  setTimeout(function(){$(".sammmary-message").animate({left:'+=150'},500).animate({left:'-=800'},1000,function(){
				  $(".main-contianer").html(data);
			  })},700);
		  },
		  dataType:'html',
		  type:'GET'
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
		  type:'GET'
	  })
  }