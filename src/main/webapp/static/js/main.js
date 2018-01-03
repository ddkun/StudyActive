$('a').mouseover(function(){
  			if($(this).prop('id')!='c'){
  				$(this).addClass('btn-success');
  			}
  		});
$('a').mouseout(function(){
	if($(this).prop('id')!='c'){
		$(this).removeClass('btn-success');
	}
});

$('.chooseStyle').click(function(){
	if($('nav').prop('class')=='navbar navbar-default navbar-fixed-top'){
		$('nav').addClass('navbar-inverse');
		$(this).html('主题2');
		$('.footer').css({'color':'white'});
	}
	else{
		$('nav').removeClass('navbar-inverse');
		$(this).html('主题1');
		$('.footer').css({'color':'black'});
	}
});

$('#fold').click(function(){
	if($('#right').prop('class')=='col-xs-9 col-md-9'){
		$('#left').hide();
		$('#right').removeClass('col-xs-9 col-md-9');
		$('#right').addClass('col-xs-12 col-md-12');
		$(this).html('<span class="glyphicon glyphicon-triangle-right"></span>');
	}
	else{
		$('#left').show();
		$('#right').removeClass('col-xs-12 col-md-12');
		$('#right').addClass('col-xs-9 col-md-9');
		$(this).html('<span class="glyphicon glyphicon-triangle-left"></span>');
	}
});
