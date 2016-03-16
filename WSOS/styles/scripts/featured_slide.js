$(document).ready(function(){
//Show Banner
	$(".preview_holder .text_holder").show(); //Show Banner
	$(".preview_holder .introtext").animate({ opacity: 0.85 }, 1 ); //Set Opacity

	//Click and Hover events for Right Selector list
	$(".selector ul li:first").addClass('active');
	$(".selector ul li").click(function(){
		//Set Variables
		var imgAlt = $(this).find('img').attr("alt"); //Get Alt Tag of Image
		var imgTitle = $(this).find('a').attr("href"); //Get Main Image URL
		var imgDesc = $(this).find('.introtext').html(); 	//Get HTML of block
		var imgDescHeight = $(".preview_holder").find('.block').height();	//Calculate height of block

		if ($(this).is(".active")) {  //If it's already active, then...
			return false; // Don't click through
		} else {
			//Animate the Image transition
			$(".preview_holder img").animate({ opacity: 0}, 500 );
			$(".preview_holder .introtext").animate({ opacity: 0, marginBottom: -imgDescHeight }, 500 , function() {
				$(".preview_holder .introtext").html(imgDesc).animate({ opacity: 0.85,	marginBottom: "0" }, 500 );
				$(".preview_holder img").attr({ src: imgTitle , alt: imgAlt}).animate({ opacity: 1}, 500 );
			});

		}

		$(".selector ul li").removeClass('active'); //Remove class of 'active' on all lists
		$(this).addClass('active');  //add class of 'active' on this list only
		return false;

	}) .hover(function(){
		$(this).addClass('hover');
		}, function() {
		$(this).removeClass('hover');
	});
});