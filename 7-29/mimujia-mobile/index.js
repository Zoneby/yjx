$(document).ready(function () {

	var indexBgList = [
		// picture
		{content: './images/banner.png'},
		{content: './images/banner.png'},
		{content: './images/banner.png'}
	];
	var indexBg = new iSlider(document.getElementById('iSilder-wrapper-indexbg'), indexBgList, {
		isAutoplay: 1,
		isLooping: 1,
		isOverspread: 1,
		animateTime: 800
	});

	 var topicBgList = [
	 	{content: './images/topic.png'},
	 	{content: './images/topic.png'},
	 	{content: './images/topic.png'}
	 ];
	 var topicBg = new iSlider(document.getElementById('iSlider-wrapper-topicbg'), topicBgList, {
	 	isLooping: 1,
	 	isOverspread: 1,
	 	isAutoplay: 1,
	 	animateTime: 800,
	 	animateType: 'flow'
	 });
});


	/*var S = document.getElementsByClassName("islider-active");
	S.style.display = "block";
	console.log(S);*/

