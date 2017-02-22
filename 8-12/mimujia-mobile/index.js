$(document).ready(function () {

		var flag = false;
	$('.series-link ').on("tap", function() {
			var icon = document.getElementById('diff-series-icon');
			if( !flag ) {
				icon.style.display = "block";
				// console.log('show');
			} else {
				icon.style.display = "none";
				// console.log('hide');
			}
			flag =!flag;

			$('.series-link').addClass('nav-link-hover');
			$('.subject-handpick-link').removeClass('nav-link-hover');
			$('.feature-mirror-link').removeClass('nav-link-hover');
			$('.optometry-link').removeClass('nav-link-hover');
			// console.log('add success!');
		});
		$('.subject-handpick-link').on("tap", function() {
			$('.series-link-part').hide();

			$('.subject-handpick-link').addClass('nav-link-hover');
			$('.series-link').removeClass('nav-link-hover');
			$('.feature-mirror-link').removeClass('nav-link-hover');
			$('.optometry-link').removeClass('nav-link-hover');
			// console.log('add success!');
		});
		$('.feature-mirror-link').on("tap", function() {
			$('.series-link-part').hide();

			$('.feature-mirror-link').addClass('nav-link-hover');
			$('.series-link').removeClass('nav-link-hover');
			$('.subject-handpick-link').removeClass('nav-link-hover');
			$('.optometry-link').removeClass('nav-link-hover');
			// console.log('add success!');
		});
		$('.optometry-link').on("tap", function() {
			$('.series-link-part').hide();
			
			$('.optometry-link').addClass('nav-link-hover');
			$('.series-link').removeClass('nav-link-hover');
			$('.subject-handpick-link').removeClass('nav-link-hover');
			$('.feature-mirror-link').removeClass('nav-link-hover');
			// console.log('add success!');
		});
		// $('#iSilder-wrapper-indexbg').touchSlider({direction: 'v',slidePercent:0.1});
});