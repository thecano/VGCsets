$(document).on 'page:change', ->
	if window._gaq?
		_gaq.push ['_trackPageview']
	else if window.pageTracker?
		pageTracker._trackPageview()
	FB.init({ status: true, cookie: true, xfbml: true });

	