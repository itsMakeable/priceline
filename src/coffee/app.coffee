###*
 * START APP.JS
###

MKBL = {}

MKBL.deactivate = (el, elClass) ->
	elClass = elClass || 'is-active'
	$(el).removeClass(elClass)

MKBL.toggleActivation = (el, elClass) ->
	elClass = elClass || 'is-active'
	$(el).toggleClass(elClass)

$('.close-button, .overlay').on 'click',  ->
	MKBL.deactivate('.number-block__instas .overlay')
	MKBL.deactivate('.number-block__instas .insta-overlay')

$('.insta-block.has-happened').on 'click',  ->
	MKBL.toggleActivation('.number-block__instas .overlay')
	MKBL.toggleActivation('.number-block__instas .insta-overlay.has-happened')

$('.insta-block.will-happen').on 'click',  ->
	MKBL.toggleActivation('.number-block__instas .overlay')
	MKBL.toggleActivation('.number-block__instas .insta-overlay.will-happen')

$ ->
	MKBL.toggleActivation('body')
	MKBL.swiper = new Swiper('.swiper-container',
		direction: 'horizontal'
		loop: false
		initialSlide: 1
		spaceBetween: 50
		centeredSlides: true
		longSwipes: false
		slidesPerView: 'auto'
		pagination: '.swiper-pagination'
	)
