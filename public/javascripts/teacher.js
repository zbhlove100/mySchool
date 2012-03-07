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