// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

window.onload = setCover();

function setCover() {
	var wh = window.innerHeight;

	if ( wh > 500 ) {
		$('.site-wrapper')
		  .css({
			'display':'block',
			'height': '100%',
			'max-height': wh,
			'overflow': 'hidden'
		  })
		  .find('.carousel-inner > .item').css('max-height',wh);
	}
}

/**
 * Smart Scroll -- Prevents a million scroll events
 */
(function($,sr){

	var debounce = function (func, threshold, execAsap) {
	  	var timeout;

	  	return function debounced () {
	      	var obj = this, args = arguments;
	      	function delayed () {
	          	if (!execAsap)
	              	func.apply(obj, args);
	          	timeout = null;
	      	};

	      	if (timeout)
	          	clearTimeout(timeout);
	      	else if (execAsap)
	          	func.apply(obj, args);

	      	timeout = setTimeout(delayed, threshold || 30);
	  	};
	}
	jQuery.fn[sr] = function(fn){  return fn ? this.bind('scroll', debounce(fn)) : this.trigger(sr); };

})(jQuery,'smartscroll');

$(document).ready(function(){
	stickyNav();
});

function stickyNav () {
    var nav      = $('nav#top_filters');
    var navHomeY = nav.offset().top;
    var isFixed  = false;
    var $w       = $(window);

	$w.smartscroll(function(){
        var scrollTop = $w.scrollTop();
        var shouldBeFixed = scrollTop > navHomeY;
        if ( shouldBeFixed && ! isFixed )
        {
            nav.css({
                position: 'fixed',
                'z-index': 110,
                top: 0,
                opacity: 0.9
            });

            isFixed = true;
        }
        else if ( ! shouldBeFixed && isFixed )
        {
            nav.css({
                position: 'relative',
                'z-index': 1,
                opacity: 1
            });

            isFixed = false;
        }
    });
}