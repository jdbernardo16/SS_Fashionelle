<!DOCTYPE html>

<!--[if !IE]><!-->
<html lang="$ContentLocale">
<!--<![endif]-->
<!--[if IE 6 ]><html lang="$ContentLocale" class="ie ie6"><![endif]-->
<!--[if IE 7 ]><html lang="$ContentLocale" class="ie ie7"><![endif]-->
<!--[if IE 8 ]><html lang="$ContentLocale" class="ie ie8"><![endif]-->
<head>
	<% base_tag %>
	<title><% if $MetaTitle %>$MetaTitle<% else %>$Title<% end_if %> &raquo; $SiteConfig.Title</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	$MetaTags(false)
	<% loop HeaderFooter %>
    <meta name="keywords" content="$SeoKeywords"> 
    <link rel="shortcut icon" href="$Favicon.Url" type="image/x-icon" />
    <% if Logo %>
         <meta property="og:image" content="$Logo.Url">    
    <% end_if %>
    <% end_loop %>
    <link rel="apple-touch-icon" href="apple-touch-icon.png">
    <meta property="og:title" content="$Title">
    <meta property="og:description" content="$MetaDescription">
    <meta property="og:url" content="{$AbsoluteBaseURL}">
    <meta property="og:site_name" content="$SiteConfig.Title">
    <meta property="og:type" content="website">
	<!--[if lt IE 9]>
	<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
    <script type='text/javascript' src='https://platform-api.sharethis.com/js/sharethis.js#property=600cddaa8bb33e00116e6feb&product=inline-share-buttons' async='async'></script>
    <!-- SweetAlert -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">

	<% require themedCss('style') %>
	
	<link rel="shortcut icon" href="themes/simple/images/favicon.ico" />
</head>
<body>
	
	<% include Header %>
	<div id="main" class="main" role="main">

		$Layout

    <% if $Content %>
        <div class="page-errorCon align-c">
            <div class="vertical-parent">
                <div class="vertical-align">
                    <h1>$Title</h1>
                    $Content
                </div>
            </div>
        </div>
    <% end_if %>

	</div>
	<% include Footer %>


<%-- Javascript --%>

 <!-- !!! -->
<script type="text/javascript">
    const pageID = '$ClassName',
    baseHref = '$BaseHref',
    themeDir = '$ThemeDir';
</script>

<!-- Load Facebook SDK for JavaScript -->
      <div id="fb-root"></div>
      <script>
        window.fbAsyncInit = function() {
          FB.init({
            xfbml            : true,
            version          : 'v9.0'
          });
        };

        (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = 'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js';
        fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));</script>

      <!-- Your Chat Plugin code -->
      <div class="fb-customerchat"
        attribution=setup_tool
        page_id="102815521776000"
         theme_color="#F2E9E4">
      </div>



<!-- Vue -->
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.11"></script>
<%-- <!-- Slick -->
<script src="//cdn.jsdelivr.net/jquery.slick/1.4.1/slick.min.js"></script>
<script src="//alexandrebuffet.fr/codepen/slider/slick-animation.min.js"></script> --%>
<!-- TweenMax -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.0/TweenMax.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.0/TweenLite.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.0/plugins/ModifiersPlugin.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.0/plugins/ScrollToPlugin.min.js"></script>

<!-- jQuery -->
<% require themedJavascript('jquery-1.11.0.min') %>
<% require themedJavascript('jquery-migrate-1.2.1.min') %>
<%-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script> --%>

<!-- Validate -->
<script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>

<!-- SweetAlert -->
<script src="//cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>

<!-- ScrollMagic -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.5/ScrollMagic.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.5/plugins/animation.gsap.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.5/plugins/debug.addIndicators.min.js"></script>



<!-- Maps -->
<script defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAzPPSOyGrO0S9NyW0oa64rtUZw43a4I5Q&callback=initMap">
</script>
<%-- <% loop ContactPage %> --%>
<% if $ContactPage %>

<% loop ContactPage %>
    <script>
        let map;

        function initMap() {

          map = new google.maps.Map(document.getElementById("map"), {
            center: { lat: $Lat, lng: $Lng },
            zoom: 16,
             // styles: [{"featureType":"administrative","elementType":"all","stylers":[{"saturation":"-100"}]},{"featureType":"administrative.province","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"landscape","elementType":"all","stylers":[{"saturation":-100},{"lightness":65},{"visibility":"on"}]},{"featureType":"poi","elementType":"all","stylers":[{"saturation":-100},{"lightness":"50"},{"visibility":"simplified"}]},{"featureType":"road","elementType":"all","stylers":[{"saturation":"-100"}]},{"featureType":"road.highway","elementType":"all","stylers":[{"visibility":"simplified"}]},{"featureType":"road.arterial","elementType":"all","stylers":[{"lightness":"30"}]},{"featureType":"road.local","elementType":"all","stylers":[{"lightness":"40"}]},{"featureType":"transit","elementType":"all","stylers":[{"saturation":-100},{"visibility":"simplified"}]},{"featureType":"water","elementType":"geometry","stylers":[{"hue":"#ffff00"},{"lightness":-25},{"saturation":-97}]},{"featureType":"water","elementType":"labels","stylers":[{"lightness":-25},{"saturation":-100}]}]
          });

           var marker = new google.maps.Marker({
                position: new google.maps.LatLng(14.78057348999291, 120.98424061665601),
                map: map,
                title: 'Fashionelle',
                icon: '$MapPin.Url',
                animation: google.maps.Animation.DROP,
            });
        }
    </script>
<% end_loop %>
<% end_if %>
 
<%-- <% end_loop %> --%>
    

<% require themedJavascript('slick.min') %>
<% require themedJavascript('script') %>
<% require themedJavascript('animate') %>
</body>
</html>
