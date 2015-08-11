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

MKBL.smoothShow = ->
	jQuery('.has-animation').each ->
	  thisItem = jQuery(this)
	  if jQuery(window).width() > 700
	    visible = thisItem.visible(true)
	    delay = thisItem.attr('data-delay')
	    if !delay
	      delay = 0
	    if thisItem.hasClass('animated')
	    else if visible
	      thisItem.delay(delay).queue ->
	        thisItem.addClass 'animated'
	        return
	  else
	    thisItem.addClass 'animated'

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

	$('.has-animation').each ->
		if $(this).visible(true)
			$(this).addClass('no-animation')
	MKBL.smoothShow()
	if $(window).width() > 1080
		MKBL.swiperOptions = 
			direction: 'horizontal'
			loop: true
			loopedSlides: $('.insta-slide').length
			initialSlide: 1
			spaceBetween: 10
			centeredSlides: true
			# longSwipes: false
			slidesPerView: 'auto'
			pagination: '.swiper-pagination'
			nextButton: '.next-button'
			prevButton: '.prev-button'
			grabCursor: true
			paginationClickable: true
	else
		MKBL.swiperOptions = 
			direction: 'horizontal'
			loop: true
			loopedSlides: $('.insta-slide').length
			initialSlide: 1
			spaceBetween: 50
			centeredSlides: true
			# longSwipes: false
			slidesPerView: 'auto'
			pagination: '.swiper-pagination'
	MKBL.swiper = new Swiper('.swiper-container',
		MKBL.swiperOptions
	)
	$('.index-slide .insta-name').on 'click', ->
		console.log $(this).attr('data-index')
		MKBL.swiper.slideTo($(this).data('index'))
	
$(window).on 'resize', ->
	if $(window).width() > 1080
		MKBL.swiperOptions = 
			direction: 'horizontal'
			loop: true
			loopedSlides: $('.insta-slide').length
			initialSlide: 1
			spaceBetween: 10
			centeredSlides: true
			# longSwipes: false
			slidesPerView: 'auto'
			pagination: '.swiper-pagination'
			nextButton: '.next-button'
			prevButton: '.prev-button'
			grabCursor: true
			paginationClickable: true
	else
		MKBL.swiperOptions = 
			direction: 'horizontal'
			loop: true
			loopedSlides: $('.insta-slide').length
			initialSlide: 1
			spaceBetween: 50
			centeredSlides: true
			# longSwipes: false
			slidesPerView: 'auto'
			pagination: '.swiper-pagination'
	MKBL.swiper = new Swiper('.swiper-container',
		MKBL.swiperOptions
	)
	if $(window).width() < 1330 && !head.ie && $(window).width() > 1080
		$('.parallax-window').parallax({
			imageSrc: 'img/header_image.png'
			naturalWidth: 960
			naturalHeight: 584
			bleed: 10
			positionX: '50%'
			positionY: '0'
		});
	else
		$('.parallax-window').css({
			'background': 'url("img/header_image.png") no-repeat'
			'background-size': 'cover'
			'background-position': '50% 10%'
		})
	

$(window).on 'scroll', ->
	MKBL.smoothShow()


$(window).on 'load', ->
	MKBL.toggleActivation('body')
	if $(window).width() > 1330 && head.retina
		$('.parallax-window').parallax({
			imageSrc: 'img/header-large.png'
			naturalWidth: 960
			naturalHeight: 584
			bleed: 10
			positionX: '50%'
			positionY: '0'
		});
	if $(window).width() < 1330 && !head.ie && $(window).width() > 1080
		$('.parallax-window').parallax({
			imageSrc: 'img/header.jpg'
			naturalWidth: 960
			naturalHeight: 584
			bleed: 10
			positionX: '50%'
			positionY: '0'
		});
	else
		$('.parallax-window').css({
			'background': 'url("img/header.jpg") no-repeat'
			'background-size': 'cover'
			'background-position': '50% 10%'
		})