$(function() {
	var rating = $('.rating');

	rating.each(function() {
		var targetScore = $(this).attr('data-rate');
		console.log(targetScore);
		$(this).find('svg:nth-child(-n' + targetScore + ')').css({color : '#f05522'});
	});
	
	var userScore = $('#makeStar');
	userScore.change(function(){
		var userScoreNum = $(this).val();
		console.log(userScoreNum);
		$('.make_star svg').css({color : '#000'});
		$('.make_star svg:nth-child(-n+' + userScoreNum + ')').css({color : '#f05522'});
	});
	
	$('.make_star svg').click(function(){
		var targetNum = $(this).index() + 1;
		$('.make_star svg').css({color : '#000'});
		$('.make_star svg:nth-child(-n+' + targetNum + ')').css({color : '#f05522'});
	});

});