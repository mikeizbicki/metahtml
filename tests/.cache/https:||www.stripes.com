<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

            <meta name="robots" content="index">
        <meta name="robots" content="ACAP allow-index">
        <meta name="GOOGLEBOT" content="index, follow">
    	
            <meta name="title" content="Stripes">
        <meta name="DC.title" content="Stripes">
                    	<meta name="description" content="The U.S. military's independent news source, featuring exclusive reports from Afghanistan, Europe and the Far East.">
    	<meta name="DC.description" content="The U.S. military's independent news source, featuring exclusive reports from Afghanistan, Europe and the Far East." /> 
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	 
                    
    	    <meta name="google-site-verification" content="Td4vrwQkiWditw20ABi0n1PBbJFmQGdiATKefwYb3bE" />
	    <meta name="msvalidate.01" content="4893DC9F9262E19721718A4A16818289" />
        
        <meta property="fb:app_id" content="165185360164551" />
    <meta property="fb:page_id" content="45623437315" />
    <meta property="fb:admins" content="100001735654878" />

        <meta property="og:site_name" content="Stars and Stripes" />
                <meta property="og:type" content="website" />
            
                            
    	<meta name="twitter:card" content="summary_large_image">
	<meta name="twitter:site" content="@starsandstripes">
	<meta name="twitter:title" content="">
	<meta name="twitter:description" content="">
				<meta name="twitter:image" content="https://www.stripes.com/img/socialmedia/images/facebook_default.jpg">
	
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

            
            	<meta property="article:tag" content="free" />
    	
                
            <title>Stripes - Independent U.S. military news from Iraq, Afghanistan and bases worldwide</title>
    	
		    	                
            	    	    		<link rel="stylesheet" type="text/css" href="/cmlink/hide-taboola-next-story-link-7.522110">
    	    		<link rel="stylesheet" type="text/css" href="/cmlink/foundation-min-7.433473">
    	    		<link rel="stylesheet" type="text/css" href="/cmlink/ie-fix-for-main-tag-7.445931">
    	        
    		    
    				<script src="/js/modernizr.js"></script>
		<script src="/js/jquery/jquery.js"></script>
		<script src="/js/foundation.min.js"></script>
		<script src="/js/foundation.clearing.js"></script>
		<script src="/js/foundation.orbit.js"></script>
		<script src="/js/foundation.topbar.js"></script>
		<script src="/js/foundation.equalizer.js"></script>
				<script src="/js/jquery-sliding-menu.js"></script>
		<script src="/js/slick.min.js"></script>
			
	
    <!--[if IE 7]>
      <link rel="stylesheet" type="text/css" href="/css/commons/ie7fixes.css">
    <![endif]-->
    <!--[if lt IE 7]>
      <link rel="stylesheet" type="text/css" href="/css/commons/ie6fixes.css">
    <![endif]--> 
    
        <script type="text/javascript">
	    var addthis_config = {
	    	ui_508_compliant: true,
	    		    };
	</script>
    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=stripes"></script>

		<!-- DFP Ad Setup -->
<script type="text/javascript" language="JavaScript">
	var dfpSitePage = 'stripes-stripes';
</script> 
            	<link rel="alternate" type="application/rss+xml" title="Most Read Android Apps" href="/cmlink/most-read-android-apps-1.404046" >        	<link rel="alternate" type="application/rss+xml" title="Most read iphone app" href="/cmlink/most-read-iphone-app-1.224069" >        	<link rel="alternate" type="application/rss+xml" title="Stars and Stripes" href="/cmlink/stars-and-stripes-1.194" >    	
	        	
                  
    
  
    
  
    
    
        <script>
// Custom CSS
$(function () {
	//detecting device
	var isMobile = {
		Android: function () {
			return navigator.userAgent.match(/Android/i);
		},
		BlackBerry: function () {
			return navigator.userAgent.match(/BlackBerry/i);
		},
		iOS: function () {
			return navigator.userAgent.match(/iPhone|iPod/i);
		},
		Opera: function () {
			return navigator.userAgent.match(/Opera Mini/i);
		},
		Windows: function () {
			return navigator.userAgent.match(/IEMobile/i);
		},
		any: function () {
			return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
		}};

	if (isMobile.any()) {
//////////////////////////////////////////////////////////////////////////// for mobile

		$(".reveal-modal").on("open", function () {
			$('body').css('overflow', 'hidden');
			$('body').addClass("modal-open");

			var mobileWindowHeight = $(window).height();
			$('#contbox').css('height', mobileWindowHeight);
		});

		$(".reveal-modal").on("closed", function () {
			$('body').removeClass('modal-open');
			$('body').css('overflow', '');
		});

		window.addEventListener("orientationchange", function () {
			$('#MenuModal').foundation('reveal', 'close');
		}, false);


	} else {
//////////////////////////////////////////////////////////////////////////// for NON mobile
		//when the page include ad, give margin on the top...
		if ($("#" + 'cont_with_ad2').length === 0) {
		} else {
			$('#main,#rail').css('margin-top', '50px');
		}

		$(window).resize(function () {
			console.log('resized');
			$('#MenuModal').foundation('reveal', 'close');
		});
	}

	$(window).scroll(function () {
		var w = $(window).width();
		var x = 1035;

		var userAgent = window.navigator.userAgent.toLowerCase();
		if (userAgent.indexOf('msie') != -1 || userAgent.indexOf('chrome') != -1 || userAgent.indexOf('firefox') != -1 || userAgent.indexOf('opera') != -1) {
			//not safari

			if (w >= x) {
				if ($(window).scrollTop() <= 220) {
					$('body').removeClass('f-topbar-fixed');
					$('.contain-to-grid.sticky').removeClass('fixed fadeInDown');
					$('#cont_with_ad2').removeClass('tofixthead animated fadeInDown');

				}
				else if ($(window).scrollTop() > 200) {
					$('body').addClass('f-topbar-fixed');
					$('div.contain-to-grid.sticky').addClass('fixed fadeInDown');
					$('#cont_with_ad2').addClass('tofixthead animated fadeInDown');
					//$('.tofixthead > .ad_l').css('display','none');	
				}
				else {
				}
			} else {
			}


		} else if (userAgent.indexOf('safari') != -1) {
			//safari

			if (w >= x) {

				$('.tab-bar.hide-for-large-up').removeClass('animate fadeIn1');

				if ($(this).scrollTop() == 0) {
					$(this).scrollTop(1);
					$('#cont_with_ad2').removeClass('tofixthead animated fadeInDown');
				}
				else if ($(window).scrollTop() <= 220) {
					$('body').removeClass('f-topbar-fixed');
					$('.contain-to-grid.sticky').removeClass('fixed fadeInDown fadeIn1');
					$('#cont_with_ad').removeClass('tofixthead');
				}
				else if ($(window).scrollTop() > 200) {
					$('body').addClass('f-topbar-fixed');
					$('div.contain-to-grid.sticky').addClass('fixed');
					$('#cont_with_ad2').addClass('tofixthead');
					//$('.tofixthead > .ad_l').css('display','none');	
				}
				else {
				}

			} else {
			}

		}

	});

	$(window).resize(function () {
		if ($(window).scrollTop() <= 200) {
			var w = $(window).width();
			var x = 1035;
			if (w >= x) {
				$("body").removeClass('f-topbar-fixed');
				$(".contain-to-grid.sticky").removeClass('fixed');
			} else {
			}
		} else {
			$("body").addClass('f-topbar-fixed');
		}
	});


//Hiding thumb from carousel when there is only one image
	$('li.clearing-featured-img').click(function () {
		$('.contain-to-grid.sticky').toggleClass('hidecont');
		$(this).each(function () {
			var num = $(this).parents('div.carousel').find('ul li').length;
			if (num === 1) {
				$(this).parents('div.carousel').find('ul.clearing-thumbs.clearing-feature').css('display', 'none');
				$(this).parents('div.clearing-assembled').find('a.clearing-main-prev').css('display', 'none');
				$(this).parents('div.clearing-assembled').find('a.clearing-main-next').css('display', 'none');
			}
			else {
			}
		});
	});

	$('.carousel').each(function () {
		var num = $(this).find('ul li').length;
		if (num === 1) {
			$(this).find('ul li').addClass('noicon');
		}
		else {
		}
	});


	$('.clearing-close').click(function () {
		$('header > div').removeClass("hidecont");
	});

	// for category menu
	$('a.button.tiny.right.picker').each(function () {
		var pulldownmobilemenutitleFirst = $(this).find('+div dl dd:first').text();
		$(this).html(pulldownmobilemenutitleFirst + ' <i class="fa fa-chevron-circle-down fa-fw"></i>');
	});

	$('dl.tabs.vertical dd').each(function () {
		$(this).click(function () {
			var pulldownmobilemenutitle = $(this).text();
			$(this).parents().foundation('dropdown', 'close', $(this).parents());
			$(this).parents().prev('a').html(pulldownmobilemenutitle + ' <i class="fa fa-chevron-circle-down fa-fw"></i>');
		});
	});


// scroll animation
	$('.link_to_top').click(function () {
		$(this).blur();
		$('html,body').animate({scrollTop: 0}, 'slow');
		return false;
	});


// style for header menu list (last)
//	$('ul.left.red.show-for-large-up li ul.dropdown li:last-child').addClass('categorylink');
//	$('ul.left.red.show-for-large-up li ul.dropdown li:nth-last-child(2) a').css({'padding-bottom': '47px'});

// background for stickymenu
	$('#MenuModal ul li.cat > a:eq(0)').css('background-color', '#002142');
	$('#MenuModal ul li.cat > a:eq(1)').css('background-color', '#0D2C4B');
	$('#MenuModal ul li.cat > a:eq(2)').css('background-color', '#193654');
	$('#MenuModal ul li.cat > a:eq(3)').css('background-color', '#2A4560');
	$('#MenuModal ul li.cat > a:eq(4)').css('background-color', '#365069');
	$('#MenuModal ul li.cat > a:eq(5)').css('background-color', '#455E74');
	$('#MenuModal ul li.cat > a:eq(6)').css('background-color', '#52687F');
	$('#MenuModal ul li.cat > a:eq(7)').css('background-color', '#5C7186');
	$('#MenuModal ul li.cat > a:eq(8)').css('background-color', '#657A8D');
	$('#MenuModal ul li.cat > a:eq(9)').css('background-color', '#708394');
	$('#MenuModal ul li.cat > a:eq(10)').css('background-color', '#7F90A0');
	$('#MenuModal ul li.cat > a:eq(11)').css('background-color', '#002142');

// behaviors of header menu	
	var currentScroll=0;
		function lockscroll(){
		$(window).scrollTop(currentScroll);
	}
	
	$(".reveal-modal").on("closed", function () {
		$('.sliding-menu-wrapper').css('margin-left', '');
		
		currentScroll=$(window).scrollTop();
       $(window).unbind('scroll',lockscroll);
		
		$('.back').addClass('hidecont');
	});

	$(".reveal-modal").on("open", function () {
		$('#menu').menu();
		
		currentScroll=$(window).scrollTop();
       $(window).bind('scroll',lockscroll);
	   
	});


//related_articles_carousel
	if($('#related_articles_carousel,#previous_coverage_carousel').length!==0){
      $('#related_articles_carousel,#previous_coverage_carousel').slick({
		dots: false,
		arrows: true,
		infinite: false,
		speed: 300,
		slidesToShow: 2,
		slidesToScroll: 1,
		responsive: [
			{
				breakpoint: 1024,
				settings: {
					slidesToShow: 2,
					slidesToScroll: 1,
					infinite: true,
					dots: false,
					arrows: true
				}
			},
			{
				breakpoint: 640,
				settings: {
					slidesToShow: 1,
					slidesToScroll: 1,
					infinite: true,
					dots: false,
					arrows: true
				}
			}
		]
	});
	}

	$("div.article_box").click(function () {
		window.location = $(this).find("a").attr("href");
		return false;
	});

});
</script>

      
    
    
        <script>
if(window.location.href.indexOf("search-7.269") > -1){
	document.write('<style>#main-content{display:none;}</style>');
	$(function() {
		$('a[href*="/scratch/"]').parent().parent().hide();
		$('#main-content').show();
	});
}
</script>

      
    
    
        <meta name="google-site-verification" content="hlKKPUwK4Mj52FGnItKp6N6dig0k7ssfOeVtcespZ_0" />

<meta property="fb:pages" content="45623437315" />

      
  
          
        
      

              <!-- Google Analytics -->
<script>
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-714126-1', 'auto');  // Replace with your property ID.
ga('send', 'pageview');
ga('require', 'ec');

</script>
<!-- End Google Analytics -->

<!-- Quantcast Tag -->
<script type="text/javascript">
var _qevents = _qevents || [];

(function() {
    var elem = document.createElement('script');
    elem.src = (document.location.protocol == "https:" ? "https://secure" : "http://edge") + ".quantserve.com/quant.js";
    elem.async = true;
    elem.type = "text/javascript";
    var scpt = document.getElementsByTagName('script')[0];
    scpt.parentNode.insertBefore(elem, scpt);
})();

_qevents.push({
    qacct:"p-rTCU463mY75FP"
});
</script>

<noscript>
<div style="display:none;">
    <img src="//pixel.quantserve.com/pixel/p-rTCU463mY75FP.gif" border="0" height="1" width="1" alt="Quantcast"/>
</div>
</noscript>
<!-- End Quantcast tag --></head>

		<body>
	<div class="off-canvas-wrap">
	<div class="inner-wrap">
					
				<header>
        	          		
                  
    
  
    
  
    
    
        <script type="text/javascript" src="//s.ntv.io/serve/load.js" async></script>

      
    
    
        <!-- Begin DFP Setup -->
<script>
var googletag = googletag || {};
googletag.cmd = googletag.cmd || [];

(function() {
	var gads = document.createElement('script');
	gads.async = true;
	gads.type = 'text/javascript';
	var useSSL = 'https:' == document.location.protocol;
	gads.src = (useSSL ? 'https:' : 'http:') +
	'//www.googletagservices.com/tag/js/gpt.js';
	var node = document.getElementsByTagName('script')[0];
	node.parentNode.insertBefore(gads, node);
})();

if ((typeof OAS_sitepage !== 'undefined') && (typeof dfpSitePage === 'undefined')) {
	var dfpSitePage = OAS_sitepage;
}
if ((typeof OAS_sitepage === 'undefined') && (typeof dfpSitePage === 'undefined')) {
	var dfpSitePage = 'stripes-stripes';
}
dfpSitePage = dfpSitePage.replace('/', '-');
dfpSitePage = dfpSitePage.toLowerCase();

googletag.cmd.push(function() {
	for (i = 1; i <= 5; i++) { 
		googletag.defineSlot('/267968996/Stripes_BigBoard'+i, [[300, 250], [300, 600]], 'Stripes_BigBoard'+i).setTargeting('sitepage',[dfpSitePage]).addService(googletag.pubads());
    }
    for (i = 1; i <= 3; i++) {
		googletag.defineSlot('/267968996/Stripes_Leaderboard'+i, [728, 90], 'Stripes_Leaderboard'+i).setTargeting('sitepage',[dfpSitePage]).addService(googletag.pubads());
    }
  //    googletag.defineSlot('/267968996/Stripes_Skyscraper'+i, [160, 600], 'Stripes_Skyscraper'+i).setTargeting('sitepage',[dfpSitePage]).addService(googletag.pubads());
  //    for (i = 1; i <= 1; i++) {
  //        googletag.defineSlot('/267968996/Stripes_Article'+i, [300, 250], 'Stripes_Article'+i).setTargeting('sitepage',[dfpSitePage]).addService(googletag.pubads());
  //	}
    googletag.defineSlot('/267968996/Stripes_Article1', [300, 250], 'Stripes_Article1').setTargeting('sitepage',[dfpSitePage]).addService(googletag.pubads());
	
  /*
	if (typeof dfpAddionalSpots !== 'undefined') {
		for (i = 0; i < dfpAddionalSpots.length; i++) {
			var additionalSpot = dfpAddionalSpots[i].replace(" ","");
			var specs = additionalSpot.split(",");
			var name = specs[0];
			var w = parseInt(specs[1]);
			var h = parseInt(specs[2]);
			googletag.defineSlot('/267968996/'+name, [w, h], name).setTargeting('sitepage',[dfpSitePage]).addService(googletag.pubads());
		}
	}
  */
    
	googletag.pubads().enableSingleRequest();
	googletag.enableServices();
});

var bbcount = 0;
var lbcount = 0;
var sscount = 0;
var arcount = 0;

var cssClass = 'dfpAdspot';

function dfpAd(spot) {
	if (spot.toLowerCase() == 'bigboard'){
		bbcount++;
		spot = 'Stripes_BigBoard'+bbcount;
		cssClass = 'dfpAdspot dfpBigBoard';
	}
	if (spot.toLowerCase() == 'leaderboard'){
		lbcount++;
		spot = 'Stripes_Leaderboard'+lbcount;
		cssClass = 'dfpAdspot dfpLeaderboard';
	}
	if (spot.toLowerCase() == 'skyscraper'){
		sscount++;
		spot = 'Stripes_Skyscraper'+sscount;
		cssClass = 'dfpAdspot dfpSkyscraper';
	}
    if (spot.toLowerCase() == 'article'){
		arcount++;
		spot = 'Stripes_Article'+arcount;
		cssClass = 'dfpAdspot dfpBigBoard';
	}

	document.write('<div class="'+cssClass+'" id="'+spot+'"></div>');
	googletag.cmd.push(function() { googletag.display(spot); });
}
</script>

<style>
.dfpBigBoardContainer {
	width: 320px;
	margin: auto;
}
.dfpLeaderboardContainer {
	width: 748px;
	margin: auto;
}
.dfpSkyscraperContainer {
	width: 180px;
}
</style>
<!-- End DFP Setup -->

      
    
    
        <div class="contain-to-grid sticky animate fadeIn1">
	<nav id="top-bar" class="top-bar show-for-xlarge-up" data-topbar data-options="is_hover: ture">
		<ul class="title-area">
			<li class="name"><!-- leave empty  --></li>
			<li class="toggle-topbar menu-icon left"><a href="#">Menu</a></li>
		</ul>
		<section class="top-bar-section">
			<!-- Right Nav Section -->
			<ul class="right">
				<li><a href="#" data-reveal-id="ShareModal"><i class="fa fa-share-square-o fa-fw"></i>&nbsp;Share</a></li>
				<li><a href="#" data-reveal-id="SearchModal"><i class="fa fa-search fa-fw"></i>&nbsp;Search</a></li>
                <!-- li><a class="subscribe-button btn btn-primary stripes-subscribe">Subscribe</a></li -->
                <li><a class="stripes-subscribe" href="/subscribe/">Subscribe</a></li>
                <li><a class="pelcro-login-button btn btn-primary stripes-login-button" style="cursor: pointer"><i class="fa fa-user fa-fw"></i>Login</a>
                </li>
			</ul>

			<!-- Left Nav Section -->
			<ul class="left">
				<li class="has-dropdown">
                  <a href="#" style="margin-right: 35px">Communities<i class="fa fa-play-circle fa-rotate-90 fa-lg" style="color:#81a9ee; margin-left: 7px;"></i></a>
					<ul class="dropdown">
						<li><a href="https://japan.stripes.com/">Stripes Japan</a></li>
						<li><a href="https://okinawa.stripes.com/">Stripes Okinawa</a></li>
						<li><a href="https://korea.stripes.com/">Stripes Korea</a></li>
						<li><a href="https://guam.stripes.com/">Stripes Guam</a></li>
                        <li><a href="https://europe.stripes.com/">Stripes Europe</a></li>
					</ul>
				</li>
				<li><a href="https://printshop.stripes.com/">Printshop</a></li>
				<li class="has-dropdown">
                    <a>Rewards<i class="fa fa-play-circle fa-rotate-90 fa-lg" style="color:#81a9ee; margin-left: 7px;"></i></a>
                    <ul class="dropdown">
                        <li><a href="/rewards">Promotions</a></li>
                        <li><a href="https://winners.stripes.com/">Winners</a></li>
                        <li><a href="/promotion-rules/">Rules</a></li>
                    </ul>
                </li>
				<li class="has-dropdown">
                    <a>About &frasl; Help<i class="fa fa-play-circle fa-rotate-90 fa-lg" style="color:#81a9ee; margin-left: 7px;"></i></a>
                    <ul class="dropdown">
                        <li><a href="/contact/">Contact</a></li>
                        <li><a href="/about#branches1-4">Reporters</a></li>
                        <li><a href="/about/">About</a></li>
                        <li><a href="/Help/">Help</a></li>
                    </ul>
                </li>
                <li><a href="http://slite.dma.mil/index.html">Stripes Lite</a></li>
				<li><a href="http://www.stripesstore.com/">Store</a></li>
                <li><a href="https://classifieds.stripes.com">Classifieds</a></li>
				<li><a href="/subscribe/email-newsletters">Newsletters</a></li>
				<li><a href="/epaper">ePaper</a></li>
				<li><a href="/apps/">Apps</a></li>
                <li><a href="/contact/advertise-with-us/">Advertise</a></li>
			</ul>
		</section>
	</nav>

  <div id="middle-bar" class="row show-for-xlarge-up">
      <div class="small-3 medium-3 large-3 columns text-center">
          <!-- Top banner ad placeholder -->
          <!-- <a href="#"><img alt="advertisement" src="/img/icons/button-hide.png"></a> -->
      </div>
    
      <!-- Main logo is large-10 when ads appear -->
      <div class="small-16 medium-16 large-16 columns">
          <div id="logo-box">
            <a href="/"><img alt="stars and stripes logo" class="main-logo" src="/img/icons/main-logo.png"></a>
          </div>
      </div>

      <div class="small-3 medium-3 large-3 columns text-center">
          <!-- Top banner ad placeholder -->
          <!-- <a href="#"><img alt="advertisement" src="/img/icons/button-hide.png"></a> -->
      </div>
  </div>

  <nav id="main-nav-wrapper" class="contain-to-grid">
      <nav id="main-nav" class="top-bar topbar show-for-xlarge-up" data-topbar data-options="is_hover: true">
          <section class="top-bar-section">
              <ul class="left red show-for-xlarge-up">
                  <li class="divider"></li>
                  <li>
                    <a href="/">Front Page</a>
                  </li>
                  <li class="divider"></li>
                  <li class="has-dropdown"><a href="/news/theaters">Theaters</a>
                    <ul class="dropdown">
                      <li><a href="/news/us">U.S.</a></li>
                      <li><a href="/news/middle-east">Middle East</a></li>
                      <li><a href="/news/europe">Europe</a></li>
                      <li><a href="/news/pacific">Pacific</a></li>
                      <li><a href="/news/americas">Americas</a></li>
                      <li><a href="/news/africa">Africa</a></li>
                    </ul>
                  </li>
                  <li class="divider"></li>
                  <li class="has-dropdown"><a href="/news/branches">Branches</a>
                      <ul class="dropdown">
                        <li><a href="/news/army">Army</a></li>
                        <li><a href="/news/navy">Navy</a></li>
                        <li><a href="/news/air-force">Air Force</a></li>
                        <li><a href="/news/marine-corps">Marine Corps</a></li>
                        <li><a href="/news/coast-guard">Coast Guard</a></li>
                        <li><a href="/news/space-force">Space Force</a></li>
                      </ul>
                  </li>
                  <li class="divider"></li>
                  <li class="has-dropdown"><a href="/news/veterans">Veterans</a>
                      <ul class="dropdown">
                        <li><a href="/news/veterans/obituaries">Obituaries</a></li>
                        <li><a href="http://veteranjobs.stripes.com/">Jobs</a></li>
                        <li><a href="/valoans">VA Loans</a></li>
                      </ul>
                  </li>
                  <li class="divider"></li>
                  <li class="has-dropdown" style="min-width: 145px"><a href="/news/special-reports">Special Reports</a>
                      <ul class="dropdown">
                        <li><a href="/news/special-reports/featured/d-day">Remembering D-Day</a></li>
                        <li><a href="/news/special-reports/vietnam-at-50/1969">Vietnam 50</a></li>
                      </ul>
                  </li>
                  <li class="divider"></li>
                  <li class="has-dropdown" style="min-width: 90px"><a href="/history">History</a>
                      <ul class="dropdown">
                        <li><a href="/news/special-reports/vietnam-at-50/1969">Vietnam at 50</a></li>
                        <li><a href="/medalofhonor">Medal of Honor</a></li>
                        <li><a href="/blogs/from-the-archives">From the Archives</a></li>
                      </ul>
                  </li>
                  <li class="divider"></li>
                  <li class="has-dropdown" style="min-width: 100px"><a href="/lifestyle">Lifestyle</a>
                      <ul class="dropdown">
                        <li><a href="/lifestyle/entertainment">Entertainment</a></li>
                        <li><a href="/lifestyle/games">Video Games</a></li>
                        <li><a href="/lifestyle/on-the-move">On the Move</a></li>
                        <li><a href="/lifestyle/education">Education</a></li>
                        <li><a href="/blogs/the-meat-and-potatoes-of-life">The Meat and Potatoes of Life</a></li>
                        <li><a href="/special-publications">Special Publications</a></li>
                      </ul>
                  </li>
                  <li class="divider"></li>
                  <li class="has-dropdown" style="min-width: 85px"><a href="/travel">Travel</a>
                      <ul class="dropdown">
                        <li><a href="/travel/europe-travel">Europe</a></li>
                        <li><a href="/travel/pacific-travel">Pacific</a></li>
                        <li><a href="/travel/us">U.S.</a></li>
                        <li><a href="/blogs/europe-traveler">Europe Traveler Blog</a></li>
                      </ul>
                  </li>
                  <li class="divider"></li>
                  <li class="has-dropdown" style="min-width: 90px"><a href="/sports">Sports</a>
                      <ul class="dropdown">
                        <li><a href="/sports/europe">Europe</a></li>
                        <!-- <li><a href="/blogs/europe-sportsblog">Europe Sports Blog</a></li> -->
                        <li><a href="/sports/pacific">Pacific</a></li>
                        <li><a href="/blogs/pacific-sportsblog">Pacific Sports Blog</a></li>
                        <li><a href="/sports/us">U.S.</a></li>
                        <li><a href="/sports/sports-perspectives">Perspectives</a></li>
                      </ul>
                  </li>
                  <li class="divider"></li>
                  <li class="has-dropdown"><a href="/columns">Columns</a>
                      <ul class="dropdown">
                        <li><a href="/opinion">Opinion</a></li>
                        <li><a href="/blogs/from-the-archives">From the Archives</a></li>
                        <li><a href="/blogs/pacific-storm-tracker">Pacific Storm Tracker</a></li>
                        <li><a href="/opinion/letters-to-the-editor">Letters</a></li>
                        <li><a href="/opinion/ombudsman">Ombudsman</a></li>
                      </ul>
                  </li>
                  <li class="divider"></li>
                  <li class="has-dropdown"><a href="/podcasts">Podcasts</a>
                       <ul class="dropdown">
                        <li><a href="/podcasts/military-matters">Military Matters</a></li>
                        <li><a href="/podcasts/force-for-hire">Force for Hire</a></li>
                      </ul>
                  </li>
                  <li class="divider"></li>
              </ul>
          </section>
      </nav>
  </nav>

  <!-- -------------- For tablet and smartphone size header -------------- -->

  <nav class="tab-bar hide-for-xlarge-up animate fadeIn1" style="background: url('/img/bg/header-back.jpeg') #001a48 center top no-repeat;" data-topbar data-options="is_hover: false">
      <!-- - left menu icon - -->
      <section class="left-small contain-to-grid sticky">
          <a data-reveal-id="MenuModal" class="menu-icon"><span></span></a>
      </section>

      <!-- - logo - -->
      <section class="middle tab-bar-section">
        <h1 class="title"><a href="//www.stripes.com/"><img alt="stars and stripes logo" class="main-logo" src="/img/icons/main-logo.png"></a></h1>
      </section>

      <!-- - right icons - -->
      <section class="right top-bar-section">
          <ul class="right">
              <li class="hide-for-small-down"><a href="#" data-reveal-id="ShareModal"><i class="fa fa-share-square-o fa-fw"></i>&nbsp;Share</a></li>
              <li class="hide-for-small-down"><a href="#" data-reveal-id="SearchModal"><i class="fa fa-search fa-fw"></i>&nbsp;Search</a></li>            
              <!-- li><a class="subscribe-button btn btn-primary stripes-subscribe">Subscribe</a></li -->
              <li><a class="stripes-subscribe" href="/subscribe/">Subscribe</a></li >
              <li><a class="pelcro-login-button btn btn-primary stripes-login-button" style="cursor: pointer"><i class="fa fa-user fa-fw"></i>Login</a></li>
          </ul>

          <!-- MODALS -->
          <div id="ShareModal" class="reveal-modal" data-reveal>
              <div class="row">
                  <div class="small-16 large-16 columns">
                      <ul class="share">
                          <li class="mail"><a href="#" class="addthis_button_email"><i class="fa fa-envelope fa-lg"></i> Email</a></li>
                          <li class="print"><a href="#" class="addthis_button_print"><i class="fa fa-print fa-lg"></i> Print</a></li>
                          <li class="reddit"><a href="#" class="addthis_button_reddit"><i class="fa fa-reddit fa-lg"></i> Reddit</a></li>
                          <li class="twitter"><a href="#" class="addthis_button_twitter"><i class="fa fa-twitter-square fa-lg"></i> Tweet</a></li>
                          <li class="facebook"><a href="#" class="addthis_button_facebook"><i class="fa fa-facebook-square fa-lg"></i> Share</a></li>
                          <li class="pinterest"><a href="#" class="pinterest addthis_button_pinterest_share"><i class="fa fa-pinterest-square fa-lg"></i> Pinterest</a></li>
                          <li class="more"><a href="#" class="addthis_button"><i class="fa fa-plus-square fa-lg"></i> More</a></li>
                      </ul>
                  </div>
              </div>
              <a class="close-reveal-modal"><i class="fa fa-times fa-fw"></i></a>
          </div>

          <div id="SearchModal" class="reveal-modal" data-reveal>
              <form action="/search-7.269" onSubmit="removeQuotes()" method="get">
                  <div class="row">
                      <div class="small-16 small-centered columns">
                          <label>
                              <input type="text" name="q" placeholder="What are you looking for?" />
                              <i class="fa fa-search fa-fw"></i>
                          </label>
                      </div>
                  </div>
              </form>
              <a class="close-reveal-modal"><i class="fa fa-times fa-fw"></i></a>
          </div>

          <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
          <div id="MenuModal" class="reveal-modal" data-reveal>
              <div class="row">
                  <div class="small-16 small-centered columns">
                      <div id="contbox">
                          <div id="menu" class="sliding-menu">
                              <div class="sliding-menu-wrapper">
									<ul id="menupanel-menutop" class="menu-panel-root nav">
										<a class="back hidecont" href="#menu-panel-back">
											<i class="fa fa-chevron-left fa-fw"></i>
										</a>
										<li class="cat"><a href="/" >Front Page</a></li>
										<li class="cat"><a href="#menu-panel-theaters" class="nav">Theaters</a></li>
										<li class="cat"><a href="#menu-panel-branches" class="nav">Branches</a></li>
										<li class="cat"><a href="#menu-panel-veterans" class="nav">Veterans</a></li>
										<li class="cat"><a href="#menu-panel-topics" class="nav">Special Reports</a></li>
										<li class="cat"><a href="#menu-panel-history" class="nav">History</a></li>
                                        <li class="cat"><a href="#menu-panel-lifestyle" class="nav">Lifestyle</a></li>
                                        <li class="cat"><a href="#menu-panel-travel" class="nav">Travel</a></li>
                                        <li class="cat"><a href="#menu-panel-sports" class="nav">Sports</a></li>
										<li class="cat"><a href="#menu-panel-columns" class="nav">Columns</a></li>
                                        <li class="cat"><a href="#menu-panel-podcasts" class="nav">Podcasts</a></li>
									</ul>

									<ul id="menu-panel-theaters" class="menu-panel nav">
										<li><a href="/news/us">U.S.</a></li>
                                        <li><a href="/news/middle-east">Middle East</a></li>
                                        <li><a href="/news/europe">Europe</a></li>
                                        <li><a href="/news/pacific">Pacific</a></li>
                                      <li><a href="/news/americas">Americas</a></li>
                                        <li><a href="/news/africa">Africa</a></li>
                                        <li><a href="/news/theaters">See More</a></li>
									</ul>

									<ul id="menu-panel-branches" class="menu-panel nav">
										<li><a href="/news/army">Army</a></li>
                                        <li><a href="/news/navy">Navy</a></li>
                                        <li><a href="/news/air-force">Air Force</a></li>
                                        <li><a href="/news/marine-corps">Marine Corps</a></li>
                                        <li><a href="/news/coast-guard">Coast Guard</a></li>
                                        <li><a href="/news/space-force">Space Force</a></li>
                                        <li><a href="/news/branches">See More</a></li>
									</ul>
									
									<ul id="menu-panel-veterans" class="menu-panel nav">
                                        <li><a href="/news/veterans/obituaries">Obituaries</a></li>
                                        <li><a href="http://veteranjobs.stripes.com/">Jobs</a></li>
                                        <li><a href="/valoans">VA Loans</a></li>
                                        <li><a href="/news/veterans">See More</a></li>
									</ul>
									
									<ul id="menu-panel-topics" class="menu-panel nav">
                                        <li><a href="/news/special-reports/featured/d-day">Remembering D-Day</a></li>
                                        <li><a href="/news/special-reports/vietnam-at-50/1969">Vietnam 50</a></li>
                                        <li><a href="/news/special-reports">See More</a></li>
									</ul>
									
									<ul id="menu-panel-history" class="menu-panel nav">
										<li><a href="/news/special-reports/vietnam-at-50/1969">Vietnam at 50</a></li>
                                        <li><a href="/medalofhonor">Medal of Honor</a></li>
                                        <li><a href="/blogs/from-the-archives">From the Archives</a></li>
                                        <li><a href="/history">See More</a></li>
									</ul>
									
									<ul id="menu-panel-lifestyle" class="menu-panel nav">
                                        <li><a href="/lifestyle/entertainment">Entertainment</a></li>
                                        <li><a href="/lifestyle/games">Video Games</a></li>
                                        <li><a href="/lifestyle/on-the-move">On the Move</a></li>
                                        <li><a href="/lifestyle/education">Education</a></li>
                                        <li><a href="/blogs/the-meat-and-potatoes-of-life">The Meat and Potatoes of Life</a></li>
                                        <li><a href="/special-publications">Special Publications</a></li>
                                        <li><a href="/lifestyle">See More</a></li>
									</ul>
									
									<ul id="menu-panel-travel" class="menu-panel nav">
										<li><a href="/travel/europe-travel">Europe</a></li>
                                        <li><a href="/travel/pacific-travel">Pacific</a></li>
                                        <li><a href="/travel/us">U.S.</a></li>
                                        <li><a href="/blogs/europe-traveler">Europe Traveler Blog</a></li>
                                        <li><a href="/travel">See More</a></li>
									</ul>

									<ul id="menu-panel-sports" class="menu-panel nav">
										<li><a href="/sports/europe">Europe</a></li>
                                        <li><a href="/blogs/europe-sportsblog">Europe Sports Blog</a></li>
                                        <li><a href="/sports/pacific">Pacific</a></li>
                                        <li><a href="/blogs/pacific-sportsblog">Pacific Sports Blog</a></li>
                                        <li><a href="/sports/us">U.S.</a></li>
                                        <li><a href="/sports">See More</a></li>
									</ul>

									<ul id="menu-panel-columns" class="menu-panel nav">
                                        <li><a href="/columns">Columnists</a></li>
										<li><a href="/opinion">Opinion</a></li>
                                        <li><a href="/blogs/from-the-archives">From the Archives</a></li>
                                        <li><a href="/blogs/pacific-storm-tracker">Pacific Storm Tracker</a></li>
                                        <li><a href="/opinion/letters-to-the-editor">Letters</a></li>
                                        <li><a href="/opinion/ombudsman">Ombudsman</a></li>
									</ul>
                                
                                    <ul id="menu-panel-podcasts" class="menu-panel nav">
                                        <li><a href="/podcasts/force-for-hire">Force for Hire</a></li>
                                        <li><a href="/podcasts">See More</a></li>
									</ul>
                            </div>
                          </div>
                      </div>
                  </div> 
                  <a class="close-reveal-modal"><i class="fa fa-times fa-fw"></i></a>
              </div>   
          </div>
    </section>
  </nav>
</div>

      
    
    
        <script>
  jQuery.fn.imagesLoaded = function (callback) {
      var elems = this.filter('img'),
              len = elems.length,
              blank = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
      elems.bind('load.imgloaded', function () {
          if (--len <= 0 && this.src !== blank) {
              elems.unbind('load.imgloaded');
              callback.call(elems, this);
          }
      }).each(function () {
          if (this.complete || this.complete === undefined) {
              var src = this.src;
              this.src = blank;
              this.src = src;
          }
      });
  
      return this;
  };
  
  
  $(function () {
	  //////////////////windowshadow ad////////////////////////////
	  if ($("#" + 'cont_with_ad2').length === 0) {
	  } else {
		
          $("#cont_with_ad2 *").imagesLoaded(function () {
			  $(window).ready(function () {
				  $('.ad_ribbon2 > .cont2').fadeIn();

                  if (document.cookie.indexOf('stripesWindowshade=1') == -1) {
					  //set cookie so windowshade only expands itself once every 24 hours
					  var d = new Date();
					  d.setTime(d.getTime() + (1*12*60*60*1000));
					  var expires = "expires="+d.toGMTString();
					  document.cookie = "stripesWindowshade=1; path=/; " + expires;
					
					  setTimeout(function () {
						  $('.ad_l2').slideDown(1000);
                          $('.ad_ribbon2').hide();
					  }, 1800);

					  setTimeout(function () {
						  $('.btn_close').fadeIn();
					  }, 2800);
                    
                      setTimeout(function () {
						  $('.ad_l2').slideUp(400);
                          setTimeout(function () {
                            $('.ad_ribbon2').show();
                          }, 400);
					  }, 7800);
                  }
			  });

			  $('.btn_close').on('click', function () {
				  $('.ad_l2').slideUp(400);
                  setTimeout(function () {
                      $('.ad_ribbon2').show();
                  }, 400);
			  });


			  $('.ad_ribbon2 > .cont2').on('click', function () {
				  $('.ad_l2').slideDown(900);
                  $('.ad_ribbon2').hide();

                  //setTimeout(function () {
					  $('.btn_close').show();
                  //}, 900);
			  });
		  });
	  }
  });
</script>

<script>
  var windowshadeRand = Math.floor(1000000000 + Math.random() * 9000000000);
  var windowshadeScript = "//pubads.g.doubleclick.net/gampad/adx?iu=/267968996/Stripes_Takeover&t=sitepage%3D" + dfpSitePage + "&sz=6x1&c=" + windowshadeRand + "&m=text/javascript";
  document.write("<script src='"+ windowshadeScript + "'><\/scr" + "ipt>");
</script>

<style>
@charset "UTF-8";
/* ===============================================================\*/
/* CSS for windowshade ad
/* Last Updated:2015.03.20
/* Editor:SSP
/* ===============================================================\*/
.bodynoscroll {
	overflow: hidden !important;
}

.ad_ribbon2 > .cont2:hover,
.btn_close img:hover {
	cursor: pointer;
}

.takeover_container {
	position: absolute;
	top: 200px;
	left: 0px;
	width: 100%;
	height: auto;
	display: block;
    z-index: 450;
}

.ad_ribbon2 {
	background-color: black;
	text-align: center;
	transition: background 300ms ease-out 0s;
}

.ad_ribbon2 > .cont2 {
	display: none;
	width: auto;
	height: auto;
	margin: 0px auto;
	text-align: center;
	vertical-align: middle;
}

.ad_ribbon2 > .cont2 * {
	display: inline-block;
}

.ad_ribbon2 > .cont2 img {
	margin: 0;
}

.ad_ribbon2 > .cont2 p {
	color: #555;
	font-family: Georgia, Times, "Times New Roman", serif;
	font-size: 20px;
	line-height: 20px;
	font-weight: lighter;
	margin: 0.5% 0px;
	padding: 0px;
}

.ad_l2 {
	position: relative;
	display: none;
	width: 100%;
	background-color: black;
	text-align: center;
}

.ad_l2 img.adimg {
	margin: auto;
}

.ad_l2 .btn_close {
	position: absolute;
	top: 0px;
	right: 0px;
	display: none;
	text-align: center;
	opacity: 0.6;
	transition: all 300ms ease-out 0s;
    font-size: 2.5em;
    margin-top: 0.25em;
    color: white;
}
.ad_l2 .btn_close:hover {
	cursor: pointer;
	opacity: 0.8;
}


.ad_mobile_ver {
	position: absolute;
	bottom: 0px;
	left: 0px;
	width: 100%;
	height: 10%;
	display: block;
	z-index: 102;
}

#cont_with_ad2_mobile {
    top: auto;
    bottom: 0px;
    position: fixed;
}
#cont_with_ad2_tablet {
    top: 45px;
}

/******************* CUSTOM SIZE QUERIES ********************/
@media only screen {} /* Define mobile styles */

@media only screen and (max-width: 40em) {
    #cont_with_ad2, #cont_with_ad2_tablet {
        display: none;
    }
    .ad_ribbon2 {
        padding-top: 0;
    }
    .ad_ribbon2 .cont2 img {
        margin: 0;
    }
    .ad_ribbon2 .cont2 p {
        display: none;
    }
} /* max-width 640px, mobile-only styles, use when QAing mobile issues */

@media only screen and (min-width: 40.063em) {} /* min-width 641px, medium screens */

@media only screen and (min-width: 40.063em) and (max-width: 64em) {
    #cont_with_ad2, #cont_with_ad2_mobile {
        display: none;
    }
} /* min-width 641px and max-width 1024px, use when QAing tablet-only issues */

@media only screen and (min-width: 64.063em) {
  #cont_with_ad2_tablet, #cont_with_ad2_mobile {
      display: none;
  }
} /* min-width 1025px, large screens */

@media only screen and (min-width: 64.063em) and (max-width: 72em) {
    #cont_with_ad2 {
        top: 45px;
    }
} /* min-width 1025px and max-width 1440px, use when QAing large screen-only issues */

@media only screen and (min-width: 90.063em) { } /* min-width 1441px, xlarge screens */

@media only screen and (min-width: 90.063em) and (max-width: 120em) { } /* min-width 1441px and max-width 1920px, use when QAing xlarge screen-only issues */

@media only screen and (min-width: 120.063em) { } /* min-width 1921px, xlarge screens */
</style>

      
    
    
        <script>
if (navigator.userAgent.match(/StripesApp/i)) {
  (function(jQuery) {
    jQuery('#mobilepopup_shadowoverlay,.sticky').hide();
    })( jQuery );
 }
</script>

      
    
    
        <script type="text/javascript" src="//downloads.mailchimp.com/js/signup-forms/popup/unique-methods/embed.js" data-dojo-config="usePlainJson: true, isDebug: false"></script><script type="text/javascript">window.dojoRequire(["mojo/signup-forms/Loader"], function(L) { L.start({"baseUrl":"mc.us2.list-manage.com","uuid":"f141047f5265cca1bca1a0c28","lid":"0ab8697a7f","uniqueMethods":true}) })</script>

      
    
    
        <script type="text/javascript">
  var cookies = document.cookie;
  if (cookies.indexOf('MCPopupReset') === -1) {
    var d = new Date();
    d.setTime(d.getTime() + (60*24*60*60*1000));
    var expires = "expires="+d.toGMTString();
    document.cookie = "MCPopupReset=1;" + expires;
    
    document.cookie = "MCPopupClosed=;expires=Thu, 01 Jan 1970; path=/;";
  }
</script>

      
    
    
        <style>
  .buyphotoicon, .buygalleryicon {
    display: none;
  }
</style>

      
  
      					</header>
		
				<div id="wrapper" class="animate fadeIn2 row">
			<main id="main" class="large-11 medium-10 small-16 columns" role="content">
							
												
																																													
														
										<section id="content" class="row">
																					
                  
    
  
    
  
    
    
        

		  
					
	    	    
	    	    	    	
	    		    		    			    		<div id="top-story" class="small-16 columns">
					<div class="row">
												

        



    
																<div class="small-16 columns">
					<a href="/news/navy/navy-trumpets-seven-of-its-11-aircraft-carriers-now-underway-after-beating-back-coronavirus-1.630965">
						<h2>Navy trumpets seven of its 11 aircraft carriers now underway after beating back coronavirus</h2>
					</a>
				</div>
													<div class="large-9 columns show-for-large-up">
						<a class="dimmer" href="/news/navy/navy-trumpets-seven-of-its-11-aircraft-carriers-now-underway-after-beating-back-coronavirus-1.630965">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='The Navy trumpeted on social media Friday, May 22, 2020, that seven of its 11 aircraft carriers are now underway.&#13;U.S. Navy' style='' alt='The Navy trumpeted on social media Friday, May 22, 2020, that seven of its 11 aircraft carriers are now underway.<br>U.S. Navy' class='' src='/polopoly_fs/1.630966.1590201026!/image/image.jpg_gen/derivatives/450x300/image.jpg' />				
			
		    
						</a>
					</div>
					<div class="small-16 columns hide-for-large-up">
						<a class="dimmer" href="/news/navy/navy-trumpets-seven-of-its-11-aircraft-carriers-now-underway-after-beating-back-coronavirus-1.630965">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='The Navy trumpeted on social media Friday, May 22, 2020, that seven of its 11 aircraft carriers are now underway.&#13;U.S. Navy' style='' alt='The Navy trumpeted on social media Friday, May 22, 2020, that seven of its 11 aircraft carriers are now underway.<br>U.S. Navy' class='' src='/polopoly_fs/1.630966.1590201026!/image/image.jpg_gen/derivatives/660x440/image.jpg' />				
			
		    
						</a>
					</div>
					<div class="small-16 large-7 columns">
													<div class="row">
						<div class="small-16 columns">
															<p>Aircraft carriers are perhaps America’s most visible manifestation of global military might, each operating with its own strike group and able to project power into hotspots.</p>
																						<hr>
													</div>
						<div class="row">
							<div class="small-16 columns">
								<ul>
																																								<li><a href="/news/navy/caretaker-crew-exits-uss-kidd-after-clearing-destroyer-of-coronavirus-1.630425">
												<h6>
													<span class="radius secondary label inline">related:</span>
													Caretaker crew exits USS Kidd after clearing destroyer of coronavirus
												</h6>
											</a></li>
																																																		<li><a href="/news/us/navy-will-restart-selection-promotion-and-continuation-boards-in-july-1.630401">
												<h6>
													<span class="radius secondary label inline">related:</span>
													Navy will restart selection, promotion, and continuation boards in July
												</h6>
											</a></li>
																											</ul>
							</div>
						</div>
					</div>
				</div>
								
	  					</div>
				</div>
	    		    
	    	     	  
  
      
    
    
        <hr class="fat"/>

      
    
    
        

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
							        
            <div class="element list teaserlist">
				            	        
	        		        	
	        		            	            			     		            	                 
																																										
							               			                 
							                   			                   									<div class="row">
																

        



    
					<div class="element teaser">
			
																		<div class="small-16 medium-6 large-6 columns show-for-medium-up">
						<a class="dimmer" href="/news/army/new-army-lieutenant-from-virginia-represents-military-at-white-house-graduation-ceremony-1.631009">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='Second Lt. Lauren Shappell of Virginia was chosen to represent military graduates at a White House ceremony Friday to honor students from the class of 2020. &#13;Lauren Shappell' style='' alt='Second Lt. Lauren Shappell of Virginia was chosen to represent military graduates at a White House ceremony Friday to honor students from the class of 2020. <br>Lauren Shappell' class='left' src='/polopoly_fs/1.631012.1590255435!/image/image.jpeg_gen/derivatives/300x200/image.jpeg' />				
			
		    
						</a>
					</div>
					<div class="small-16 medium-6 large-6 columns hide-for-medium-up">
						<a class="dimmer" href="/news/army/new-army-lieutenant-from-virginia-represents-military-at-white-house-graduation-ceremony-1.631009">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='Second Lt. Lauren Shappell of Virginia was chosen to represent military graduates at a White House ceremony Friday to honor students from the class of 2020. &#13;Lauren Shappell' style='' alt='Second Lt. Lauren Shappell of Virginia was chosen to represent military graduates at a White House ceremony Friday to honor students from the class of 2020. <br>Lauren Shappell' class='left' src='/polopoly_fs/1.631012.1590255435!/image/image.jpeg_gen/derivatives/600x400/image.jpeg' />				
			
		    
						</a>
					</div>
									
																	<div class="small-16 medium-10 large-10 columns">
													<a href="/news/army/new-army-lieutenant-from-virginia-represents-military-at-white-house-graduation-ceremony-1.631009"><h4>New Army lieutenant from Virginia represents military at White House graduation ceremony</h4></a>
							<p class="show-for-large-up">As a newly commissioned second lieutenant in the Army, Lauren Shappell’s first assignment attracted a call of support from a four-star general. Her mission: to represent the military at a White House commencement ceremony.</p>
												</div>
					        </div>
      							</div>
								           			     		            	                 
																																										
							               			                 
							                   			                   			                   			<hr>
                   										<div class="row">
																

        



    
					<div class="element teaser">
			
																		<div class="small-16 medium-6 large-6 columns show-for-medium-up">
						<a class="dimmer" href="/news/middle-east/taliban-afghan-government-announce-three-day-cease-fire-to-mark-eid-holiday-1.631028">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='Afghan soldiers patrol a road in northern Kunduz province on Tuesday, May 19, 2020.&#13;Afghanistan defense ministry' style='' alt='Afghan soldiers patrol a road in northern Kunduz province on Tuesday, May 19, 2020.<br>Afghanistan defense ministry' class='left' src='/polopoly_fs/1.631030.1590262652!/image/image.jpg_gen/derivatives/300x200/image.jpg' />				
			
		    
						</a>
					</div>
					<div class="small-16 medium-6 large-6 columns hide-for-medium-up">
						<a class="dimmer" href="/news/middle-east/taliban-afghan-government-announce-three-day-cease-fire-to-mark-eid-holiday-1.631028">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='Afghan soldiers patrol a road in northern Kunduz province on Tuesday, May 19, 2020.&#13;Afghanistan defense ministry' style='' alt='Afghan soldiers patrol a road in northern Kunduz province on Tuesday, May 19, 2020.<br>Afghanistan defense ministry' class='left' src='/polopoly_fs/1.631030.1590262652!/image/image.jpg_gen/derivatives/600x400/image.jpg' />				
			
		    
						</a>
					</div>
									
																	<div class="small-16 medium-10 large-10 columns">
													<a href="/news/middle-east/taliban-afghan-government-announce-three-day-cease-fire-to-mark-eid-holiday-1.631028"><h4>Taliban, Afghan government announce three-day cease-fire to mark Eid holiday</h4></a>
							<p class="show-for-large-up">The Taliban and the Afghan government have announced a three-day ceasefire across Afghanistan starting Sunday to mark the Islamic holiday of Eid al-Fitr.</p>
												</div>
					        </div>
      							</div>
								           			     		            	                 
																																										
							               			                 
							                   			                   			                   			<hr>
                   										<div class="row">
																

        



    
					<div class="element teaser">
			
																		<div class="small-16 medium-6 large-6 columns show-for-medium-up">
						<a class="dimmer" href="/news/us/family-of-missing-fort-hood-soldier-pleads-for-help-after-one-month-with-no-answers-1.630960">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='Pfc. Vanessa Guillen was last seen at 1 p.m. Wednesday in the parking lot of the Regimental Engineer Squadron Headquarters for 3rd Cavalry Regiment, according to a release from Fort Hood and U.S. Army Criminal Investigation Command.&#13;Fort Hood/ U.S. Army' style='' alt='Pfc. Vanessa Guillen was last seen at 1 p.m. Wednesday in the parking lot of the Regimental Engineer Squadron Headquarters for 3rd Cavalry Regiment, according to a release from Fort Hood and U.S. Army Criminal Investigation Command.<br>Fort Hood/ U.S. Army' class='left' src='/polopoly_fs/1.627614.1588027079!/image/image.png_gen/derivatives/300x200/image.png' />				
			
		    
						</a>
					</div>
					<div class="small-16 medium-6 large-6 columns hide-for-medium-up">
						<a class="dimmer" href="/news/us/family-of-missing-fort-hood-soldier-pleads-for-help-after-one-month-with-no-answers-1.630960">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='Pfc. Vanessa Guillen was last seen at 1 p.m. Wednesday in the parking lot of the Regimental Engineer Squadron Headquarters for 3rd Cavalry Regiment, according to a release from Fort Hood and U.S. Army Criminal Investigation Command.&#13;Fort Hood/ U.S. Army' style='' alt='Pfc. Vanessa Guillen was last seen at 1 p.m. Wednesday in the parking lot of the Regimental Engineer Squadron Headquarters for 3rd Cavalry Regiment, according to a release from Fort Hood and U.S. Army Criminal Investigation Command.<br>Fort Hood/ U.S. Army' class='left' src='/polopoly_fs/1.627614.1588027079!/image/image.png_gen/derivatives/600x400/image.png' />				
			
		    
						</a>
					</div>
									
																	<div class="small-16 medium-10 large-10 columns">
													<a href="/news/us/family-of-missing-fort-hood-soldier-pleads-for-help-after-one-month-with-no-answers-1.630960"><h4>Family of missing Fort Hood soldier pleads for help after one month with no answers</h4></a>
							<p class="show-for-large-up">Pfc. Vanessa Guillen was last seen at 1 p.m. April 22 in the parking lot of the Regimental Engineer Squadron Headquarters for the 3rd Cavalry Regiment at Fort Hood.</p>
												</div>
					        </div>
      							</div>
								           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     	            </div>
			</div>
				
	  	
      
    
    
        

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    		            	        	<h4 class="block-header">
	        				        		<span>more top headlines</span>
	        			    		</h4>
	    			
							        
            <div class="element list combolist">
				            		                	                	                    
	        		        	
	        		            	            			     		            			     		            			     		            			     		            	                 
						
							               			                 
								                   			                   				                       			                       			                       	<div class="row">
		                       		

        



    
					<div class="element teaser">
			
																		<div class="small-16 medium-6 large-6 columns show-for-medium-up">
						<a class="dimmer" href="/news/pacific/xi-says-china-won-t-return-to-planned-economy-urges-cooperation-1.631031">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='Chinese President Xi Jinping attends the G20 Extraordinary Virtual Leaders&#39; Summit on COVID-19 via video link in Beijing on March 26, 2020. &#13;Li Xueren/Xinhua/Zuma Press/TNS' style='' alt='Chinese President Xi Jinping attends the G20 Extraordinary Virtual Leaders&#39; Summit on COVID-19 via video link in Beijing on March 26, 2020. <br>Li Xueren/Xinhua/Zuma Press/TNS' class='left' src='/polopoly_fs/1.631032.1590262824!/image/image.JPG_gen/derivatives/300x200/image.JPG' />				
			
		    
						</a>
					</div>
					<div class="small-16 medium-6 large-6 columns hide-for-medium-up">
						<a class="dimmer" href="/news/pacific/xi-says-china-won-t-return-to-planned-economy-urges-cooperation-1.631031">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='Chinese President Xi Jinping attends the G20 Extraordinary Virtual Leaders&#39; Summit on COVID-19 via video link in Beijing on March 26, 2020. &#13;Li Xueren/Xinhua/Zuma Press/TNS' style='' alt='Chinese President Xi Jinping attends the G20 Extraordinary Virtual Leaders&#39; Summit on COVID-19 via video link in Beijing on March 26, 2020. <br>Li Xueren/Xinhua/Zuma Press/TNS' class='left' src='/polopoly_fs/1.631032.1590262824!/image/image.JPG_gen/derivatives/600x400/image.JPG' />				
			
		    
						</a>
					</div>
									
																	<div class="small-16 medium-10 large-10 columns">
													<a href="/news/pacific/xi-says-china-won-t-return-to-planned-economy-urges-cooperation-1.631031"><h4>Xi says China won't return to 'planned economy,' urges cooperation</h4></a>
							<p class="show-for-large-up">Chinese President Xi Jinping said he won't let the world's second-largest economy return to its days as a "planned economy," pushing back against U.S. criticism that the nation has failed to deliver on promised reforms.</p>
												</div>
					        </div>
      		                       	</div>
		                       			                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                       			                       				                       	<hr>
		                       			                       	<div class="row">
		                       		

        



    
					<div class="element teaser">
			
																		<div class="small-16 medium-6 large-6 columns show-for-medium-up">
						<a class="dimmer" href="/news/two-isis-regional-leaders-killed-during-joint-raid-in-syria-coalition-says-1.630979">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='Green Berets in southern Syria prepare to fire an 81 mm mortar weapon system during a live-fire exercise in March. Members of the U.S.-led anti-Islamic State coalition and their Syrian partner forces carried out a series of raids against in the country&#39;s northeast, killing two regional leaders, in recent weeks the U.S.-led Operation Inherent Resolve said Friday, May 22, 2020. &#13;William Howard/U.S. Army' style='' alt='Green Berets in southern Syria prepare to fire an 81 mm mortar weapon system during a live-fire exercise in March. Members of the U.S.-led anti-Islamic State coalition and their Syrian partner forces carried out a series of raids against in the country&#39;s northeast, killing two regional leaders, in recent weeks the U.S.-led Operation Inherent Resolve said Friday, May 22, 2020. <br>William Howard/U.S. Army' class='left' src='/polopoly_fs/1.630982.1590242711!/image/image.jpg_gen/derivatives/300x200/image.jpg' />				
			
		    
						</a>
					</div>
					<div class="small-16 medium-6 large-6 columns hide-for-medium-up">
						<a class="dimmer" href="/news/two-isis-regional-leaders-killed-during-joint-raid-in-syria-coalition-says-1.630979">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='Green Berets in southern Syria prepare to fire an 81 mm mortar weapon system during a live-fire exercise in March. Members of the U.S.-led anti-Islamic State coalition and their Syrian partner forces carried out a series of raids against in the country&#39;s northeast, killing two regional leaders, in recent weeks the U.S.-led Operation Inherent Resolve said Friday, May 22, 2020. &#13;William Howard/U.S. Army' style='' alt='Green Berets in southern Syria prepare to fire an 81 mm mortar weapon system during a live-fire exercise in March. Members of the U.S.-led anti-Islamic State coalition and their Syrian partner forces carried out a series of raids against in the country&#39;s northeast, killing two regional leaders, in recent weeks the U.S.-led Operation Inherent Resolve said Friday, May 22, 2020. <br>William Howard/U.S. Army' class='left' src='/polopoly_fs/1.630982.1590242711!/image/image.jpg_gen/derivatives/600x400/image.jpg' />				
			
		    
						</a>
					</div>
									
																	<div class="small-16 medium-10 large-10 columns">
													<a href="/news/two-isis-regional-leaders-killed-during-joint-raid-in-syria-coalition-says-1.630979"><h4>Two ISIS regional leaders killed during joint raid in Syria, coalition says</h4></a>
							<p class="show-for-large-up">The terrorist group’s governor of North Baghdad, known as Abu Ali al-Baghdadi, was killed in Deir al-Zour province, along with a senior logistics and supply official known as Abu Ammar.</p>
												</div>
					        </div>
      		                       	</div>
		                       			                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                       			                       				                       	<hr>
		                       			                       	<div class="row">
		                       		

        



    
					<div class="element teaser">
			
																		<div class="small-16 medium-6 large-6 columns show-for-medium-up">
						<a class="dimmer" href="/news/us-submits-new-plan-to-fix-visa-delays-for-interpreters-who-helped-troops-1.630974">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='Baran &quot;Rainman,&quot; a former Iraqi linguist, and the man who sponsored him for a Special Immigrant Visa - then 1st Lt. David Henderson, a psychological operations officer attached to the 2nd Brigade Combat Team, 3rd Infantry Division - hold an expended artillery round that landed near their forward operating base during a 2009 deployment to Forward Operating Base Marez in Mosul, Iraq. &#13;U.S. Army' style='' alt='Baran &quot;Rainman,&quot; a former Iraqi linguist, and the man who sponsored him for a Special Immigrant Visa - then 1st Lt. David Henderson, a psychological operations officer attached to the 2nd Brigade Combat Team, 3rd Infantry Division - hold an expended artillery round that landed near their forward operating base during a 2009 deployment to Forward Operating Base Marez in Mosul, Iraq. <br>U.S. Army' class='left' src='/polopoly_fs/1.630975.1590233039!/image/image.JPG_gen/derivatives/300x200/image.JPG' />				
			
		    
						</a>
					</div>
					<div class="small-16 medium-6 large-6 columns hide-for-medium-up">
						<a class="dimmer" href="/news/us-submits-new-plan-to-fix-visa-delays-for-interpreters-who-helped-troops-1.630974">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='Baran &quot;Rainman,&quot; a former Iraqi linguist, and the man who sponsored him for a Special Immigrant Visa - then 1st Lt. David Henderson, a psychological operations officer attached to the 2nd Brigade Combat Team, 3rd Infantry Division - hold an expended artillery round that landed near their forward operating base during a 2009 deployment to Forward Operating Base Marez in Mosul, Iraq. &#13;U.S. Army' style='' alt='Baran &quot;Rainman,&quot; a former Iraqi linguist, and the man who sponsored him for a Special Immigrant Visa - then 1st Lt. David Henderson, a psychological operations officer attached to the 2nd Brigade Combat Team, 3rd Infantry Division - hold an expended artillery round that landed near their forward operating base during a 2009 deployment to Forward Operating Base Marez in Mosul, Iraq. <br>U.S. Army' class='left' src='/polopoly_fs/1.630975.1590233039!/image/image.JPG_gen/derivatives/600x400/image.JPG' />				
			
		    
						</a>
					</div>
									
																	<div class="small-16 medium-10 large-10 columns">
													<a href="/news/us-submits-new-plan-to-fix-visa-delays-for-interpreters-who-helped-troops-1.630974"><h4>US submits new plan to fix visa delays for interpreters who helped troops</h4></a>
							<p class="show-for-large-up">The State Department agreed to follow timelines for processing applications for interpreters included in a 2018 class action lawsuit.</p>
												</div>
					        </div>
      		                       	</div>
		                       			                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
																										<hr>
									<div class="row">
										<div class="small-16 columns">
											<ul class="small-block-grid-1 medium-block-grid-2 large-block-grid-2">
										                       	
		                       	<li>
								

        



    
					<a href="/news/us/medal-of-honor-sought-for-navy-pilot-s-top-secret-actions-during-korean-war-1.630990">
			<h6>Medal of Honor sought for Navy pilot's top secret actions during Korean War</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
										                       	
		                       	<li>
								

        



    
					<a href="/news/europe/seven-may-have-been-infected-at-germany-restaurant-1.630970">
			<h6>Seven may have been infected at Germany restaurant </h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
										                       	
		                       	<li>
								

        



    
					<a href="/news/us/us-army-plans-massive-recruiting-drive-for-summer-1.630967">
			<h6>US Army plans massive recruiting drive for summer</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
										                       	
		                       	<li>
								

        



    
					<a href="/news/us/iraq-war-veteran-wages-internal-battle-every-memorial-day-1.630985">
			<h6>Iraq War veteran wages internal battle every Memorial Day</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
										                       	
		                       	<li>
								

        



    
					<a href="/news/marine-corporal-receives-medal-for-saving-injured-motorist-1.630844">
			<h6>Marine corporal receives medal for saving injured motorist</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
										                       	
		                       	<li>
								

        



    
					<a href="/news/air-force/air-force-cancels-fitness-assessments-over-coronavirus-concerns-1.630812">
			<h6>Air Force cancels fitness assessments over coronavirus concerns</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
										                       	
		                       	<li>
								

        



    
					<a href="/news/us/no-longer-too-short-to-fly-air-force-lifts-height-restrictions-for-pilots-1.630941">
			<h6>No longer too short to fly: Air Force lifts height restrictions for pilots</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
										                       	
		                       	<li>
								

        



    
					<a href="/news/us/uss-zumwalt-fires-first-rounds-from-onboard-gun-in-test-off-california-1.630825">
			<h6>USS Zumwalt fires first rounds from onboard gun in test off California</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     			     		</ul>
		     		</div>
		     		</div>
		     	            </div>
			</div>
				
	  	
      
    
    
        <div class="forceForHireContainer row" style="margin:0 0 1em 0;">
  <div class="small-16 columns">
   <hr class="thickLine">
   <br/>
  </div>

  <div class="small-16 columns episodeContainer">
    <div class="large-5 medium-6 columns" style="padding-left: 0;">
      <img src="https://www.stripes.com/polopoly_fs/1.630752.1590092362!/image/image.jpg" alt="force for hire album">
    </div>
    <div class="large-11 medium-10 columns">
      <h5 style="line-height: 1;color: #c51212;">PODCAST</h5>
      
      <!-- CHANGE URL BELOW TO NEW STORY -->
      <a href="https://www.stripes.com/podcasts/military-matters/season-finale-information-warfare-and-how-to-avoid-being-manipulated-1.630808">
        
        <!-- CHANGE EPISODE NUMBER AND HEADLINE -->
        <h3 style="line-height: 1.1;font-weight: bold;">Season finale: Information warfare and how to avoid being manipulated </h3>
      
      </a>
      
      <!-- CHANGE LEAD TEXT -->
      <p style="margin-bottom: 0.7em;">In the season finale of the Military Matters podcast, hosts Rod Rodriguez and Desmon Farris shed light on the murky world of information warfare and get insight from industry experts including Rand Waltzman, deputy chief technology officer of the RAND Corporation, Michael Shermer, who is a science writer and founder of Skeptic magazine, and Bob Reid, senior managing editor of Stars and Stripes.</p>
    
    </div>
  </div>
  <div class="small-16 columns" style="padding-top: 0.5em;">
    
    <!-- CHANGE OUT SCRIPT BELOW WITH NEW EPISODE SCRIPT FROM BUZZSPROUT -->
<iframe style="border: none" src="//html5-player.libsyn.com/embed/episode/id/14521931/height/90/theme/custom/thumbnail/no/direction/backward/render-playlist/no/custom-color/000000/" height="90" width="100%" scrolling="no"  allowfullscreen webkitallowfullscreen mozallowfullscreen oallowfullscreen msallowfullscreen></iframe>

  </div>
</div>
  <div class="small-16 columns">
    <div class="row" style="padding: 0 1em;">
      <div class="large-4 columns">
        <a href="https://podcasts.apple.com/us/podcast/military-matters/id1492342435" class="button"><span><i class="fa fa-apple fa-fw"></i></span> Apple</a>
      </div>
       <div class="large-4 columns">
        <a href="https://open.spotify.com/show/1VH6TgyLW5WU3xNo9lFvJL" class="button"><span><i class="fa fa-spotify fa-fw"></i></span> Spotify</a>
      </div>
       <div class="large-4 columns">
        <a href="https://play.google.com/music/listen?u=0#/ps/Ikpxl6lgksqh4724oxcgach4xla" class="button"><span><i class="fa fa-google fa-fw"></i></span> Google</a>
      </div>
      <div class="large-4 columns">
        <a href="https://www.stitcher.com/podcast/military-matters-2" class="button"><span><i class="fa fa-play fa-fw"></i></span> Stitcher</a>
      </div>
    </div>
    <hr class="thickLine">
  </div>

      
    
    
        <hr class="fat"/>

      
    
    
        <!------ Doubleclick Leaderboard ad begin ------>
<script>
  // Convert screen width to em units
  var width = $(window).width() / parseFloat($("html").css("font-size"));
  
  if(width <= 40) {
    document.write('<div class="small-16 columns">');
    document.write('<section id="filmstrip" class="panel no-border">');
    document.write('<div class="small-16 small-centered columns" style="padding-left: 0rem;">');
    dfpAd('bigboard');
    document.write('</div>');
    document.write('</section>');
    document.write('</div>');
  }
  else {
    document.write('<div class="small-16 columns">');
    document.write('<div class="leaderboard panel no-border">');
    document.write('<div class="small-centered columns">');
    dfpAd('leaderboard');
    document.write('</div>');
    document.write('</div>');
    document.write('</div>');
  }
</script>
<!------ Doubleclick Leaderboard ad end ------>

      
    
    
        <div class="small-16 columns">
  <h4 class="block-header">
    <span>Recent Videos</span>
  </h4>
  <div id="widget-video-player"></div>
  <script src="https://content.jwplatform.com/libraries/QfI5p9g0.js"></script>
  <script>
      jwplayer("widget-video-player").setup({
        playlist: "//content.jwplatform.com/v2/playlists/GYr80vet",
        width: "100%",
        aspectratio: "16:9",
        displaytitle: true,
        displaydescription: false,
        image: "",
        related: {
          autoplaytimer: 10,
          displayMode: "shelfWidget",
          onclick: "link",
          oncomplete: "autoplay"
        },
        "sharing": {
        "sites": ["reddit","facebook","twitter"]
        },
        autostart: false,
        stretching: "uniform"
      });
  </script>
</div>

      
    
    
        <hr class="fat"/>

      
    
    
        

		
		
										
		                	
							<div class="small-16 columns">
					    			            			        	<h4 class="block-header">
		        					        		<span>featured</span>
		        				    		</h4>
		    			    	
		    			    	
		    			    	
		    				    				    							<ul class="small-block-grid-2 medium-block-grid-2 large-block-grid-3">
						
																		<li>
								





								
								                        	                					<a class="dimmer"  href="https://www.stripes.com/news/recent-us-military-promotion-lists-1.393601">
				                
                								



    		
        
	        
	            
	        
                    	    
									<img style='' alt='' class='hbar-image' src='/polopoly_fs/1.580672.1557601726!/image/image.jpg_gen/derivatives/360x230/image.jpg' />				
			
		    
                                  </a>
                                
                					<a  href="https://www.stripes.com/news/recent-us-military-promotion-lists-1.393601">
								        			<h5>NEW | U.S. Army junior enlisted for June, 2020</h5>
    												</a>
                            		          
	    
							</li>
					 						 																				<li>
								





								
								                        	                					<a class="dimmer"  href="http://www.stripes.com/news/us/we-re-looking-for-pictures-of-your-hometown-veterans-memorials-1.380519">
				                
                								



    		
        
	        
	            
	        
                    	    
									<img style='' alt='' class='hbar-image' src='/polopoly_fs/1.533100.1529097603!/image/image.jpg_gen/derivatives/360x230/image.jpg' />				
			
		    
                                  </a>
                                
                					<a  href="http://www.stripes.com/news/us/we-re-looking-for-pictures-of-your-hometown-veterans-memorials-1.380519">
								        			<h5>Share photos of your hometown's war memorials</h5>
    												</a>
                            		          
	    
							</li>
					 						 																				<li>
								





								
								                        	                					<a class="dimmer"  href="http://www.stripes.com/blogs/from-the-archives">
				                
                								



    		
        
	        
	            
	        
                    	    
									<img style='' alt='' class='hbar-image' src='/polopoly_fs/1.631020.1590257908!/image/image.jpg_gen/derivatives/360x230/image.jpg' />				
			
		    
                                  </a>
                                
                					<a  href="http://www.stripes.com/blogs/from-the-archives">
								        			<h5>Archive Photo of the Day</h5>
    												</a>
                            		          
	    
							</li>
					 						 																				<li>
								





								
								                        	                					<a class="dimmer"  href="http://www.stripes.com/lifestyle/military-history">
				                
                								



    		
        
	        
	            
	        
                    	    
									<img style='' alt='' class='hbar-image' src='/polopoly_fs/1.553618.1540502330!/image/image.jpg_gen/derivatives/360x230/image.jpg' />				
			
		    
                                  </a>
                                
                					<a  href="http://www.stripes.com/lifestyle/military-history">
								        			<h5>Military History: Stories, videos and timelines</h5>
    												</a>
                            		          
	    
							</li>
					 						 																				<li>
								





								
								                        	                					<a class="dimmer"  href="http://www.stripes.com/news/veterans">
				                
                								



    		
        
	        
	            
	        
                    	    
									<img style='' alt='' class='hbar-image' src='/polopoly_fs/1.435305.1477097201!/image/image.jpg_gen/derivatives/360x230/image.jpg' />				
			
		    
                                  </a>
                                
                					<a  href="http://www.stripes.com/news/veterans">
								        			<h5>VA and veterans news</h5>
    												</a>
                            		          
	    
							</li>
					 						 																				<li>
								





								
								                        	                					<a class="dimmer"  href="http://www.stripes.com/sports">
				                
                								



    		
        
	        
	            
	        
                    	    
									<img style='' alt='' class='hbar-image' src='/polopoly_fs/1.378748.1447429129!/image/image.jpg_gen/derivatives/360x230/image.jpg' />				
			
		    
                                  </a>
                                
                					<a  href="http://www.stripes.com/sports">
								        			<h5>Europe & Pacific sports</h5>
    												</a>
                            		          
	    
							</li>
					 						 																																																																																																																																																																																																																																																																																																																																											</ul>
							</div>
			
						
	  	
      
    
    
        <hr class="fat"/>

      
    
    
        <!------ Doubleclick Leaderboard ad begin ------>
<script>
  // Convert screen width to em units
  var width = $(window).width() / parseFloat($("html").css("font-size"));
  
  if(width <= 40) {
    document.write('<div class="small-16 columns">');
    document.write('<section id="filmstrip" class="panel no-border">');
    document.write('<div class="small-16 small-centered columns" style="padding-left: 0rem;">');
    dfpAd('bigboard');
    document.write('</div>');
    document.write('</section>');
    document.write('</div>');
  }
  else {
    document.write('<div class="small-16 columns">');
    document.write('<div class="leaderboard panel no-border">');
    document.write('<div class="small-centered columns">');
    dfpAd('leaderboard');
    document.write('</div>');
    document.write('</div>');
    document.write('</div>');
  }
</script>
<!------ Doubleclick Leaderboard ad end ------>

      
    
    
        

		
		
										
		                	
										<div class="hbar-bg small-16 columns">
				<div class="panel no-border">
								    				            			        	<h4 class="panel-header left">
				        					        		<span>in case you missed it...</span>
			        					    		</h4>
			    		<hr>
			    				    	
							    		
		    				    								<ul class="small-block-grid-1 medium-block-grid-1 large-block-grid-3">
										 						 								 		<li>
						 			

        



    
																	<a class="dimmer" href="/news/hopsec-beer-rating-app-could-pose-a-military-security-threat-1.630310">
																

        

    		
        
	        
	            
	        
                    	    
									<img title='A bottle of Red River Brewing Company&#39;s Fear the Dark sits on the brewery bar in Shreveport, La., March 16, 2019. Open source researchers with the group Bellingcat used a beer app called Untappd to find details about users from the military and intelligence communities, said a report released Monday, May 18, 2020.&#13;Garrett L. Dipuma/Army National Guard' style='' alt='A bottle of Red River Brewing Company&#39;s Fear the Dark sits on the brewery bar in Shreveport, La., March 16, 2019. Open source researchers with the group Bellingcat used a beer app called Untappd to find details about users from the military and intelligence communities, said a report released Monday, May 18, 2020.<br>Garrett L. Dipuma/Army National Guard' class='hbar-image' src='/polopoly_fs/1.630314.1589897223!/image/image.jpg_gen/derivatives/600x400/image.jpg' />				
			
		    
                                  </a>
                                        <a href="/news/hopsec-beer-rating-app-could-pose-a-military-security-threat-1.630310">
            	            		<h5>HOPSEC: Beer rating app could pose a military security threat</h5>
        		        	</a>
        	    					
	  						 		</li>
						 							 							 						 								 		<li>
						 			

        



    
																	<a class="dimmer" href="/news/pacific/murder-hornets-a-common-challenge-for-us-military-pest-control-workers-in-japan-1.630293">
																

        

    		
        
	        
	            
	        
                            
									<img title='Staff Sgt. Vincent Sarver, an entomologist on Yokota Air Base in western Tokyo, holds two Asian giant hornet carcasses, Monday, May 18, 2020.&#13;Theron Godbold/Stars and Stripes' style='' alt='Staff Sgt. Vincent Sarver, an entomologist on Yokota Air Base in western Tokyo, holds two Asian giant hornet carcasses, Monday, May 18, 2020.<br>Theron Godbold/Stars and Stripes' class='hbar-image' src='/polopoly_fs/1.630296.1590025914!/image/image.jpg_gen/derivatives/600x400/image.jpg' />				
			
		    
                                  </a>
                                        <a href="/news/pacific/murder-hornets-a-common-challenge-for-us-military-pest-control-workers-in-japan-1.630293">
            	            		<h5>‘Murder hornets’ a common challenge for US military pest control workers in Japan</h5>
        		        	</a>
        	    					
	  						 		</li>
						 							 							 						 								 		<li>
						 			

        



    
																	<a class="dimmer" href="/news/europe/forgotten-1999-time-capsule-opened-at-aviano-air-base-1.630439">
																

        

    		
        
	        
	            
	        
                    	    
									<img title='Air Force Staff Sgt. Michael D. Szydlowski, 57th Rescue Squadron pararescueman, opens a time capsule at Aviano Air Base, Italy, May 15, 2020. &#13; Ericka Woolever/U.S. Air Force' style='' alt='Air Force Staff Sgt. Michael D. Szydlowski, 57th Rescue Squadron pararescueman, opens a time capsule at Aviano Air Base, Italy, May 15, 2020. <br> Ericka Woolever/U.S. Air Force' class='hbar-image' src='/polopoly_fs/1.630443.1589963690!/image/image.jpg_gen/derivatives/600x400/image.jpg' />				
			
		    
                                  </a>
                                        <a href="/news/europe/forgotten-1999-time-capsule-opened-at-aviano-air-base-1.630439">
            	            		<h5>Forgotten 1999 time capsule opened at Aviano Air Base</h5>
        		        	</a>
        	    					
	  						 		</li>
						 							 							 						 </ul>
				</div>
			</div>
						
	  	
      
    
    
        		



		<div class="small-16 columns">
		<dl class="tabbedElementGroup tabs show-for-medium-up" data-tab>
												<dd class="active">
								
																			<a href="#tab3628011">u.s.</a>
													</dd>
												<dd>
								
																			<a href="#tab3628012">pacific</a>
													</dd>
												<dd>
								
																			<a href="#tab3628013">europe</a>
													</dd>
												<dd>
								
																			<a href="#tab3628014">middle east</a>
													</dd>
												<dd>
								
																			<a href="#tab3628015">africa</a>
													</dd>
										<a href="https://www.stripes.com/news/theaters">
					<span class="round alert label right see-more">see all</span>
				</a>
					</dl>

				<div class="tabs-content show-for-medium-up">
												<div id="tab3628011" class="content active">
								
					<div class="row">
						<div class="small-16 columns">
							<div class="row">
								

  
	
	<div class="small-16 columns">
					
		<div class="container twoColumnsLeftHeavy row">
							<div class="small-16 medium-16 large-12 columns">
			
				<div class="row">
    				
                  
    
  
    
  
    
    
        

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
							        
            <div class="element list teaserlist">
				            	        
	        		        	
	        		            	            	                 
						
							               			                 
							                   			                   									<div class="row">
																

        



    
					<div class="element teaser">
			
																		<div class="small-6 medium-6 large-6 columns">
						<a class="dimmer" href="/news/us/white-house-opposes-extending-600-a-week-benefit-for-jobless-workers-beyond-july-1.631021">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='&#13;' style='' alt='<br>' class='left' src='/polopoly_fs/1.631022.1590259634!/image/image.jpg_gen/derivatives/box_210/image.jpg' />				
			
		    
						</a>
					</div>
									
																	<div class="small-10 medium-10 large-10 columns">
													<a href="/news/us/white-house-opposes-extending-600-a-week-benefit-for-jobless-workers-beyond-july-1.631021"><h4>White House opposes extending $600 a week benefit for jobless workers beyond July</h4></a>
							<p class="show-for-large-up">The White House does not support extending increased federal unemployment assistance to workers who lost jobs during the coronavirus pandemic. Instead, economic advisers to President Donald Trump say they prefer to help closed businesses reopen.</p>
												</div>
					        </div>
      							</div>
								           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     	            </div>
			</div>
				
	  	
      
  
      				</div>
          	</div>
          	<div class="small-16 columns hide-for-large-up">
          		<hr>
          	</div>

          	          		<div class="small-16 medium-16 large-4 columns">
          	
				<div class="row">
    				
                  
    
  
    
  
    
    
        

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
						
            <div class="element list ">
				            	        
	        		        	
	        		            	            			     		            	                 
						
							               			                 
								                   			                   			                   										<ul class="margin-none">
	                   				                   	
		                   			                   			                   			                   	<li><h6>
		                        

        



    
					<a href="/news/us/poll-shows-who-believes-theory-that-bill-gates-wants-to-use-vaccine-to-microchip-them-1.631037">
			<h6>Poll shows who believes theory that Bill Gates wants to use vaccine to microchip them</h6>
		</a>
		
	  		                       								</h6></li>
		             			           			     		            	                 
						
							               			                 
								                   			                   			                   	
		                   			                   			                   			                   	<li><h6>
		                        

        



    
					<a href="/news/us/when-coronavirus-vaccine-arrives-72-of-americans-say-they-ll-get-one-survey-finds-1.631035">
			<h6>When coronavirus vaccine arrives, 72% of Americans say they'll get one, survey finds</h6>
		</a>
		
	  		                       								</h6></li>
		             			           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     	            </div>
			</div>
				
	  	
      
  
      				</div>
			</div>
		</div>
	</div>

								
																
																			<div class="small-16 columns">
											<div class="panel no-border tabs-see-more-box">
												<a href="http://www.stripes.com/news/us">
																											<p class="tabs-see-more-url"><strong>See more U.S. news</strong></p>
																									</a>
											</div>
										</div>
																								</div>
						</div>
					</div>
				</div>
												<div id="tab3628012" class="content">
								
					<div class="row">
						<div class="small-16 columns">
							<div class="row">
								

  
	
	<div class="small-16 columns">
					
		<div class="container twoColumnsLeftHeavy row">
							<div class="small-16 medium-16 large-12 columns">
			
				<div class="row">
    				
                  
    
  
    
  
    
    
        

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
							        
            <div class="element list teaserlist">
				            	        
	        		        	
	        		            	            	                 
						
							               			                 
							                   			                   									<div class="row">
																

        



    
					<div class="element teaser">
			
																		<div class="small-6 medium-6 large-6 columns">
						<a class="dimmer" href="/news/pacific/xi-says-china-won-t-return-to-planned-economy-urges-cooperation-1.631031">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='Chinese President Xi Jinping attends the G20 Extraordinary Virtual Leaders&#39; Summit on COVID-19 via video link in Beijing on March 26, 2020. &#13;Li Xueren/Xinhua/Zuma Press/TNS' style='' alt='Chinese President Xi Jinping attends the G20 Extraordinary Virtual Leaders&#39; Summit on COVID-19 via video link in Beijing on March 26, 2020. <br>Li Xueren/Xinhua/Zuma Press/TNS' class='left' src='/polopoly_fs/1.631032.1590262824!/image/image.JPG_gen/derivatives/box_210/image.JPG' />				
			
		    
						</a>
					</div>
									
																	<div class="small-10 medium-10 large-10 columns">
													<a href="/news/pacific/xi-says-china-won-t-return-to-planned-economy-urges-cooperation-1.631031"><h4>Xi says China won't return to 'planned economy,' urges cooperation</h4></a>
							<p class="show-for-large-up">Chinese President Xi Jinping said he won't let the world's second-largest economy return to its days as a "planned economy," pushing back against U.S. criticism that the nation has failed to deliver on promised reforms.</p>
												</div>
					        </div>
      							</div>
								           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     	            </div>
			</div>
				
	  	
      
  
      				</div>
          	</div>
          	<div class="small-16 columns hide-for-large-up">
          		<hr>
          	</div>

          	          		<div class="small-16 medium-16 large-4 columns">
          	
				<div class="row">
    				
                  
    
  
    
  
    
    
        

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
						
            <div class="element list ">
				            	        
	        		        	
	        		            	            			     		            	                 
						
							               			                 
								                   			                   			                   										<ul class="margin-none">
	                   				                   	
		                   			                   			                   			                   	<li><h6>
		                        

        



    
					<a href="/news/pacific/hong-kong-is-in-a-state-of-shock-new-law-is-china-s-latest-show-of-strength-1.631002">
			<h6>'Hong Kong is in a state of shock': New law is China's latest show of strength</h6>
		</a>
		
	  		                       								</h6></li>
		             			           			     		            	                 
						
							               			                 
								                   			                   			                   	
		                   			                   			                   			                   	<li><h6>
		                        

        



    
					<a href="/news/pacific/zero-cases-in-china-as-virus-surges-in-latin-america-india-1.630994">
			<h6>Zero cases in China as virus surges in Latin America, India</h6>
		</a>
		
	  		                       								</h6></li>
		             			           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     	            </div>
			</div>
				
	  	
      
  
      				</div>
			</div>
		</div>
	</div>

								
																
																			<div class="small-16 columns">
											<div class="panel no-border tabs-see-more-box">
												<a href="http://www.stripes.com/news/pacific">
																											<p class="tabs-see-more-url"><strong>See more Pacific news</strong></p>
																									</a>
											</div>
										</div>
																								</div>
						</div>
					</div>
				</div>
												<div id="tab3628013" class="content">
								
					<div class="row">
						<div class="small-16 columns">
							<div class="row">
								

  
	
	<div class="small-16 columns">
					
		<div class="container twoColumnsLeftHeavy row">
							<div class="small-16 medium-16 large-12 columns">
			
				<div class="row">
    				
                  
    
  
    
  
    
    
        

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
							        
            <div class="element list teaserlist">
				            	        
	        		        	
	        		            	            	                 
						
							               			                 
							                   			                   									<div class="row">
																

        



    
					<div class="element teaser">
			
		
												<div class="small-16 medium-16 large-16 columns">
									<a href="/news/europe/seven-may-have-been-infected-at-germany-restaurant-1.630970"><h4>Seven may have been infected at Germany restaurant </h4></a>
							<p class="show-for-large-up">Germany started loosening its coronavirus restrictions on April 20 and that process has gathered pace recently.</p>
												</div>
					        </div>
      							</div>
								           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     	            </div>
			</div>
				
	  	
      
  
      				</div>
          	</div>
          	<div class="small-16 columns hide-for-large-up">
          		<hr>
          	</div>

          	          		<div class="small-16 medium-16 large-4 columns">
          	
				<div class="row">
    				
                  
    
  
    
  
    
    
        

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
						
            <div class="element list ">
				            	        
	        		        	
	        		            	            			     		            	                 
						
							               			                 
								                   			                   			                   										<ul class="margin-none">
	                   				                   	
		                   			                   			                   			                   	<li><h6>
		                        

        



    
					<a href="/news/europe/time-running-out-on-the-last-us-russia-nuclear-arms-treaty-1.630996">
			<h6>Time running out on the last US-Russia nuclear arms treaty</h6>
		</a>
		
	  		                       								</h6></li>
		             			           			     		            	                 
						
							               			                 
								                   			                   			                   	
		                   			                   			                   			                   	<li><h6>
		                        

        



    
					<a href="/news/europe/body-of-ukraine-lawmaker-found-in-office-had-gunshot-wound-1.631039">
			<h6>Body of Ukraine lawmaker found in office, had gunshot wound</h6>
		</a>
		
	  		                       								</h6></li>
		             			           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     	            </div>
			</div>
				
	  	
      
  
      				</div>
			</div>
		</div>
	</div>

								
																
																			<div class="small-16 columns">
											<div class="panel no-border tabs-see-more-box">
												<a href="http://www.stripes.com/news/europe">
																											<p class="tabs-see-more-url"><strong>See more Europe news</strong></p>
																									</a>
											</div>
										</div>
																								</div>
						</div>
					</div>
				</div>
												<div id="tab3628014" class="content">
								
					<div class="row">
						<div class="small-16 columns">
							<div class="row">
								

  
	
	<div class="small-16 columns">
					
		<div class="container twoColumnsLeftHeavy row">
							<div class="small-16 medium-16 large-12 columns">
			
				<div class="row">
    				
                  
    
  
    
  
    
    
        

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
							        
            <div class="element list teaserlist">
				            	        
	        		        	
	        		            	            	                 
						
							               			                 
							                   			                   									<div class="row">
																

        



    
					<div class="element teaser">
			
																		<div class="small-6 medium-6 large-6 columns">
						<a class="dimmer" href="/news/middle-east/taliban-afghan-government-announce-three-day-cease-fire-to-mark-eid-holiday-1.631028">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='Afghan soldiers patrol a road in northern Kunduz province on Tuesday, May 19, 2020.&#13;Afghanistan defense ministry' style='' alt='Afghan soldiers patrol a road in northern Kunduz province on Tuesday, May 19, 2020.<br>Afghanistan defense ministry' class='left' src='/polopoly_fs/1.631030.1590262652!/image/image.jpg_gen/derivatives/box_210/image.jpg' />				
			
		    
						</a>
					</div>
									
																	<div class="small-10 medium-10 large-10 columns">
													<a href="/news/middle-east/taliban-afghan-government-announce-three-day-cease-fire-to-mark-eid-holiday-1.631028"><h4>Taliban, Afghan government announce three-day cease-fire to mark Eid holiday</h4></a>
							<p class="show-for-large-up">The Taliban and the Afghan government have announced a three-day ceasefire across Afghanistan starting Sunday to mark the Islamic holiday of Eid al-Fitr.</p>
												</div>
					        </div>
      							</div>
								           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     	            </div>
			</div>
				
	  	
      
  
      				</div>
          	</div>
          	<div class="small-16 columns hide-for-large-up">
          		<hr>
          	</div>

          	          		<div class="small-16 medium-16 large-4 columns">
          	
				<div class="row">
    				
                  
    
  
    
  
    
    
        

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
						
            <div class="element list ">
				            	        
	        		        	
	        		            	            			     		            	                 
						
							               			                 
								                   			                   			                   										<ul class="margin-none">
	                   				                   	
		                   			                   			                   			                   	<li><h6>
		                        

        



    
					<a href="/news/two-isis-regional-leaders-killed-during-joint-raid-in-syria-coalition-says-1.630979">
			<h6>Two ISIS regional leaders killed during joint raid in Syria, coalition says</h6>
		</a>
		
	  		                       								</h6></li>
		             			           			     		            	                 
						
							               			                 
								                   			                   			                   	
		                   			                   			                   			                   	<li><h6>
		                        

        



    
					<a href="/news/us-submits-new-plan-to-fix-visa-delays-for-interpreters-who-helped-troops-1.630974">
			<h6>US submits new plan to fix visa delays for interpreters who helped troops</h6>
		</a>
		
	  		                       								</h6></li>
		             			           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     	            </div>
			</div>
				
	  	
      
  
      				</div>
			</div>
		</div>
	</div>

								
																
																			<div class="small-16 columns">
											<div class="panel no-border tabs-see-more-box">
												<a href="http://www.stripes.com/news/middle-east">
																											<p class="tabs-see-more-url"><strong>See more Middle East news</strong></p>
																									</a>
											</div>
										</div>
																								</div>
						</div>
					</div>
				</div>
												<div id="tab3628015" class="content">
								
					<div class="row">
						<div class="small-16 columns">
							<div class="row">
								

  
	
	<div class="small-16 columns">
					
		<div class="container twoColumnsLeftHeavy row">
							<div class="small-16 medium-16 large-12 columns">
			
				<div class="row">
    				
                  
    
  
    
  
    
    
        

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
							        
            <div class="element list teaserlist">
				            	        
	        		        	
	        		            	            	                 
						
							               			                 
							                   			                   									<div class="row">
																

        



    
					<div class="element teaser">
			
																		<div class="small-6 medium-6 large-6 columns">
						<a class="dimmer" href="/news/africa/libya-s-hifter-tripoli-campaign-to-continue-despite-losses-1.631040">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='Libyan Gen. Khalifa Hifter attends a meeting in Athens, Greece, on Jan. 17, 2020. &#13;Petros Giannakouris/AP' style='' alt='Libyan Gen. Khalifa Hifter attends a meeting in Athens, Greece, on Jan. 17, 2020. <br>Petros Giannakouris/AP' class='left' src='/polopoly_fs/1.631041.1590267050!/image/image.jpg_gen/derivatives/box_210/image.jpg' />				
			
		    
						</a>
					</div>
									
																	<div class="small-10 medium-10 large-10 columns">
													<a href="/news/africa/libya-s-hifter-tripoli-campaign-to-continue-despite-losses-1.631040"><h4>Libya's Hifter: Tripoli campaign to continue despite losses</h4></a>
							<p class="show-for-large-up">The military commander of eastern Libya-based forces Saturday said they will continue fighting forces loosely allied with the U.N.-supported government in Tripoli, even though his campaign has suffered setbacks in recent weeks.</p>
												</div>
					        </div>
      							</div>
								           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     	            </div>
			</div>
				
	  	
      
  
      				</div>
          	</div>
          	<div class="small-16 columns hide-for-large-up">
          		<hr>
          	</div>

          	          		<div class="small-16 medium-16 large-4 columns">
          	
				<div class="row">
    				
                  
    
  
    
  
    
    
        

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
						
            <div class="element list ">
				            	        
	        		        	
	        		            	            			     		            	                 
						
							               			                 
								                   			                   			                   										<ul class="margin-none">
	                   				                   	
		                   			                   			                   			                   	<li><h6>
		                        

        



    
					<a href="/news/africa/as-military-power-shifts-in-libya-turkey-and-russia-control-its-fate-1.630992">
			<h6>As military power shifts in Libya, Turkey and Russia control its fate</h6>
		</a>
		
	  		                       								</h6></li>
		             			           			     		            	                 
						
							               			                 
								                   			                   			                   	
		                   			                   			                   			                   	<li><h6>
		                        

        



    
					<a href="/news/africa/balcony-church-gains-popularity-in-kenya-amid-pandemic-1.630968">
			<h6>Balcony church gains popularity in Kenya amid pandemic</h6>
		</a>
		
	  		                       								</h6></li>
		             			           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     	            </div>
			</div>
				
	  	
      
  
      				</div>
			</div>
		</div>
	</div>

								
																
																			<div class="small-16 columns">
											<div class="panel no-border tabs-see-more-box">
												<a href="http://www.stripes.com/news/africa">
																											<p class="tabs-see-more-url"><strong>See more Africa news</strong></p>
																									</a>
											</div>
										</div>
																								</div>
						</div>
					</div>
				</div>
					</div>
		
				<div class="row hide-for-medium-up small-tab">
			<div class="small-16 columns">
								<a data-dropdown="drop-362801" aria-controls="drop-362801" aria-expanded="false" aria-autoclose="true" class="button tiny right picker">choose&nbsp;<i class="fa fa-chevron-circle-down fa-fw"></i></a>
				<div id="drop-362801" data-dropdown-content class="f-dropdown content" aria-hidden="true" tabindex="-1">
					<dl class="tabs vertical" data-tab>
																					<dd class="active">
														
																															<a href="#tab3628011">u.s.</a>
																						</dd>
																					<dd>
														
																															<a href="#tab3628012">pacific</a>
																						</dd>
																					<dd>
														
																															<a href="#tab3628013">europe</a>
																						</dd>
																					<dd>
														
																															<a href="#tab3628014">middle east</a>
																						</dd>
																					<dd>
														
																															<a href="#tab3628015">africa</a>
																						</dd>
											</dl>
				</div>
				
													<a href="https://www.stripes.com/news/theaters">
						<h4 class="block-header"><span>theaters</span></h4>
					</a>
								<div class="tabs-content vertical hide-for-medium-up">
																		<div id="tab3628011" class="content active">
									
							<div class="row">
								<div class="small-16 columns">
									<div class="row">
										

  
	
	<div class="small-16 columns">
					
		<div class="container twoColumnsLeftHeavy row">
							<div class="small-16 medium-16 large-12 columns">
			
				<div class="row">
    				
                  
    
  
    
  
    
    
        

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
							        
            <div class="element list teaserlist">
				            	        
	        		        	
	        		            	            	                 
						
							               			                 
							                   			                   									<div class="row">
																

        



    
					<div class="element teaser">
			
																		<div class="small-6 medium-6 large-6 columns">
						<a class="dimmer" href="/news/us/white-house-opposes-extending-600-a-week-benefit-for-jobless-workers-beyond-july-1.631021">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='&#13;' style='' alt='<br>' class='left' src='/polopoly_fs/1.631022.1590259634!/image/image.jpg_gen/derivatives/box_210/image.jpg' />				
			
		    
						</a>
					</div>
									
																	<div class="small-10 medium-10 large-10 columns">
													<a href="/news/us/white-house-opposes-extending-600-a-week-benefit-for-jobless-workers-beyond-july-1.631021"><h4>White House opposes extending $600 a week benefit for jobless workers beyond July</h4></a>
							<p class="show-for-large-up">The White House does not support extending increased federal unemployment assistance to workers who lost jobs during the coronavirus pandemic. Instead, economic advisers to President Donald Trump say they prefer to help closed businesses reopen.</p>
												</div>
					        </div>
      							</div>
								           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     	            </div>
			</div>
				
	  	
      
  
      				</div>
          	</div>
          	<div class="small-16 columns hide-for-large-up">
          		<hr>
          	</div>

          	          		<div class="small-16 medium-16 large-4 columns">
          	
				<div class="row">
    				
                  
    
  
    
  
    
    
        

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
						
            <div class="element list ">
				            	        
	        		        	
	        		            	            			     		            	                 
						
							               			                 
								                   			                   			                   										<ul class="margin-none">
	                   				                   	
		                   			                   			                   			                   	<li><h6>
		                        

        



    
					<a href="/news/us/poll-shows-who-believes-theory-that-bill-gates-wants-to-use-vaccine-to-microchip-them-1.631037">
			<h6>Poll shows who believes theory that Bill Gates wants to use vaccine to microchip them</h6>
		</a>
		
	  		                       								</h6></li>
		             			           			     		            	                 
						
							               			                 
								                   			                   			                   	
		                   			                   			                   			                   	<li><h6>
		                        

        



    
					<a href="/news/us/when-coronavirus-vaccine-arrives-72-of-americans-say-they-ll-get-one-survey-finds-1.631035">
			<h6>When coronavirus vaccine arrives, 72% of Americans say they'll get one, survey finds</h6>
		</a>
		
	  		                       								</h6></li>
		             			           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     	            </div>
			</div>
				
	  	
      
  
      				</div>
			</div>
		</div>
	</div>

										
																						
																							<div class="small-16 columns">
													<div class="row panel no-border tabs-see-more-box">
														<a href="http://www.stripes.com/news/us">
																															<p class="tabs-see-more-url"><strong>See more U.S. news</strong></p>
																													</a>
													</div>
												</div>
																														</div>
								</div>
							</div>
						</div>
																		<div id="tab3628012" class="content">
									
							<div class="row">
								<div class="small-16 columns">
									<div class="row">
										

  
	
	<div class="small-16 columns">
					
		<div class="container twoColumnsLeftHeavy row">
							<div class="small-16 medium-16 large-12 columns">
			
				<div class="row">
    				
                  
    
  
    
  
    
    
        

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
							        
            <div class="element list teaserlist">
				            	        
	        		        	
	        		            	            	                 
						
							               			                 
							                   			                   									<div class="row">
																

        



    
					<div class="element teaser">
			
																		<div class="small-6 medium-6 large-6 columns">
						<a class="dimmer" href="/news/pacific/xi-says-china-won-t-return-to-planned-economy-urges-cooperation-1.631031">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='Chinese President Xi Jinping attends the G20 Extraordinary Virtual Leaders&#39; Summit on COVID-19 via video link in Beijing on March 26, 2020. &#13;Li Xueren/Xinhua/Zuma Press/TNS' style='' alt='Chinese President Xi Jinping attends the G20 Extraordinary Virtual Leaders&#39; Summit on COVID-19 via video link in Beijing on March 26, 2020. <br>Li Xueren/Xinhua/Zuma Press/TNS' class='left' src='/polopoly_fs/1.631032.1590262824!/image/image.JPG_gen/derivatives/box_210/image.JPG' />				
			
		    
						</a>
					</div>
									
																	<div class="small-10 medium-10 large-10 columns">
													<a href="/news/pacific/xi-says-china-won-t-return-to-planned-economy-urges-cooperation-1.631031"><h4>Xi says China won't return to 'planned economy,' urges cooperation</h4></a>
							<p class="show-for-large-up">Chinese President Xi Jinping said he won't let the world's second-largest economy return to its days as a "planned economy," pushing back against U.S. criticism that the nation has failed to deliver on promised reforms.</p>
												</div>
					        </div>
      							</div>
								           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     	            </div>
			</div>
				
	  	
      
  
      				</div>
          	</div>
          	<div class="small-16 columns hide-for-large-up">
          		<hr>
          	</div>

          	          		<div class="small-16 medium-16 large-4 columns">
          	
				<div class="row">
    				
                  
    
  
    
  
    
    
        

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
						
            <div class="element list ">
				            	        
	        		        	
	        		            	            			     		            	                 
						
							               			                 
								                   			                   			                   										<ul class="margin-none">
	                   				                   	
		                   			                   			                   			                   	<li><h6>
		                        

        



    
					<a href="/news/pacific/hong-kong-is-in-a-state-of-shock-new-law-is-china-s-latest-show-of-strength-1.631002">
			<h6>'Hong Kong is in a state of shock': New law is China's latest show of strength</h6>
		</a>
		
	  		                       								</h6></li>
		             			           			     		            	                 
						
							               			                 
								                   			                   			                   	
		                   			                   			                   			                   	<li><h6>
		                        

        



    
					<a href="/news/pacific/zero-cases-in-china-as-virus-surges-in-latin-america-india-1.630994">
			<h6>Zero cases in China as virus surges in Latin America, India</h6>
		</a>
		
	  		                       								</h6></li>
		             			           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     	            </div>
			</div>
				
	  	
      
  
      				</div>
			</div>
		</div>
	</div>

										
																						
																							<div class="small-16 columns">
													<div class="row panel no-border tabs-see-more-box">
														<a href="http://www.stripes.com/news/pacific">
																															<p class="tabs-see-more-url"><strong>See more Pacific news</strong></p>
																													</a>
													</div>
												</div>
																														</div>
								</div>
							</div>
						</div>
																		<div id="tab3628013" class="content">
									
							<div class="row">
								<div class="small-16 columns">
									<div class="row">
										

  
	
	<div class="small-16 columns">
					
		<div class="container twoColumnsLeftHeavy row">
							<div class="small-16 medium-16 large-12 columns">
			
				<div class="row">
    				
                  
    
  
    
  
    
    
        

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
							        
            <div class="element list teaserlist">
				            	        
	        		        	
	        		            	            	                 
						
							               			                 
							                   			                   									<div class="row">
																

        



    
					<div class="element teaser">
			
		
												<div class="small-16 medium-16 large-16 columns">
									<a href="/news/europe/seven-may-have-been-infected-at-germany-restaurant-1.630970"><h4>Seven may have been infected at Germany restaurant </h4></a>
							<p class="show-for-large-up">Germany started loosening its coronavirus restrictions on April 20 and that process has gathered pace recently.</p>
												</div>
					        </div>
      							</div>
								           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     	            </div>
			</div>
				
	  	
      
  
      				</div>
          	</div>
          	<div class="small-16 columns hide-for-large-up">
          		<hr>
          	</div>

          	          		<div class="small-16 medium-16 large-4 columns">
          	
				<div class="row">
    				
                  
    
  
    
  
    
    
        

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
						
            <div class="element list ">
				            	        
	        		        	
	        		            	            			     		            	                 
						
							               			                 
								                   			                   			                   										<ul class="margin-none">
	                   				                   	
		                   			                   			                   			                   	<li><h6>
		                        

        



    
					<a href="/news/europe/time-running-out-on-the-last-us-russia-nuclear-arms-treaty-1.630996">
			<h6>Time running out on the last US-Russia nuclear arms treaty</h6>
		</a>
		
	  		                       								</h6></li>
		             			           			     		            	                 
						
							               			                 
								                   			                   			                   	
		                   			                   			                   			                   	<li><h6>
		                        

        



    
					<a href="/news/europe/body-of-ukraine-lawmaker-found-in-office-had-gunshot-wound-1.631039">
			<h6>Body of Ukraine lawmaker found in office, had gunshot wound</h6>
		</a>
		
	  		                       								</h6></li>
		             			           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     	            </div>
			</div>
				
	  	
      
  
      				</div>
			</div>
		</div>
	</div>

										
																						
																							<div class="small-16 columns">
													<div class="row panel no-border tabs-see-more-box">
														<a href="http://www.stripes.com/news/europe">
																															<p class="tabs-see-more-url"><strong>See more Europe news</strong></p>
																													</a>
													</div>
												</div>
																														</div>
								</div>
							</div>
						</div>
																		<div id="tab3628014" class="content">
									
							<div class="row">
								<div class="small-16 columns">
									<div class="row">
										

  
	
	<div class="small-16 columns">
					
		<div class="container twoColumnsLeftHeavy row">
							<div class="small-16 medium-16 large-12 columns">
			
				<div class="row">
    				
                  
    
  
    
  
    
    
        

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
							        
            <div class="element list teaserlist">
				            	        
	        		        	
	        		            	            	                 
						
							               			                 
							                   			                   									<div class="row">
																

        



    
					<div class="element teaser">
			
																		<div class="small-6 medium-6 large-6 columns">
						<a class="dimmer" href="/news/middle-east/taliban-afghan-government-announce-three-day-cease-fire-to-mark-eid-holiday-1.631028">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='Afghan soldiers patrol a road in northern Kunduz province on Tuesday, May 19, 2020.&#13;Afghanistan defense ministry' style='' alt='Afghan soldiers patrol a road in northern Kunduz province on Tuesday, May 19, 2020.<br>Afghanistan defense ministry' class='left' src='/polopoly_fs/1.631030.1590262652!/image/image.jpg_gen/derivatives/box_210/image.jpg' />				
			
		    
						</a>
					</div>
									
																	<div class="small-10 medium-10 large-10 columns">
													<a href="/news/middle-east/taliban-afghan-government-announce-three-day-cease-fire-to-mark-eid-holiday-1.631028"><h4>Taliban, Afghan government announce three-day cease-fire to mark Eid holiday</h4></a>
							<p class="show-for-large-up">The Taliban and the Afghan government have announced a three-day ceasefire across Afghanistan starting Sunday to mark the Islamic holiday of Eid al-Fitr.</p>
												</div>
					        </div>
      							</div>
								           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     	            </div>
			</div>
				
	  	
      
  
      				</div>
          	</div>
          	<div class="small-16 columns hide-for-large-up">
          		<hr>
          	</div>

          	          		<div class="small-16 medium-16 large-4 columns">
          	
				<div class="row">
    				
                  
    
  
    
  
    
    
        

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
						
            <div class="element list ">
				            	        
	        		        	
	        		            	            			     		            	                 
						
							               			                 
								                   			                   			                   										<ul class="margin-none">
	                   				                   	
		                   			                   			                   			                   	<li><h6>
		                        

        



    
					<a href="/news/two-isis-regional-leaders-killed-during-joint-raid-in-syria-coalition-says-1.630979">
			<h6>Two ISIS regional leaders killed during joint raid in Syria, coalition says</h6>
		</a>
		
	  		                       								</h6></li>
		             			           			     		            	                 
						
							               			                 
								                   			                   			                   	
		                   			                   			                   			                   	<li><h6>
		                        

        



    
					<a href="/news/us-submits-new-plan-to-fix-visa-delays-for-interpreters-who-helped-troops-1.630974">
			<h6>US submits new plan to fix visa delays for interpreters who helped troops</h6>
		</a>
		
	  		                       								</h6></li>
		             			           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     	            </div>
			</div>
				
	  	
      
  
      				</div>
			</div>
		</div>
	</div>

										
																						
																							<div class="small-16 columns">
													<div class="row panel no-border tabs-see-more-box">
														<a href="http://www.stripes.com/news/middle-east">
																															<p class="tabs-see-more-url"><strong>See more Middle East news</strong></p>
																													</a>
													</div>
												</div>
																														</div>
								</div>
							</div>
						</div>
																		<div id="tab3628015" class="content">
									
							<div class="row">
								<div class="small-16 columns">
									<div class="row">
										

  
	
	<div class="small-16 columns">
					
		<div class="container twoColumnsLeftHeavy row">
							<div class="small-16 medium-16 large-12 columns">
			
				<div class="row">
    				
                  
    
  
    
  
    
    
        

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
							        
            <div class="element list teaserlist">
				            	        
	        		        	
	        		            	            	                 
						
							               			                 
							                   			                   									<div class="row">
																

        



    
					<div class="element teaser">
			
																		<div class="small-6 medium-6 large-6 columns">
						<a class="dimmer" href="/news/africa/libya-s-hifter-tripoli-campaign-to-continue-despite-losses-1.631040">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='Libyan Gen. Khalifa Hifter attends a meeting in Athens, Greece, on Jan. 17, 2020. &#13;Petros Giannakouris/AP' style='' alt='Libyan Gen. Khalifa Hifter attends a meeting in Athens, Greece, on Jan. 17, 2020. <br>Petros Giannakouris/AP' class='left' src='/polopoly_fs/1.631041.1590267050!/image/image.jpg_gen/derivatives/box_210/image.jpg' />				
			
		    
						</a>
					</div>
									
																	<div class="small-10 medium-10 large-10 columns">
													<a href="/news/africa/libya-s-hifter-tripoli-campaign-to-continue-despite-losses-1.631040"><h4>Libya's Hifter: Tripoli campaign to continue despite losses</h4></a>
							<p class="show-for-large-up">The military commander of eastern Libya-based forces Saturday said they will continue fighting forces loosely allied with the U.N.-supported government in Tripoli, even though his campaign has suffered setbacks in recent weeks.</p>
												</div>
					        </div>
      							</div>
								           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     	            </div>
			</div>
				
	  	
      
  
      				</div>
          	</div>
          	<div class="small-16 columns hide-for-large-up">
          		<hr>
          	</div>

          	          		<div class="small-16 medium-16 large-4 columns">
          	
				<div class="row">
    				
                  
    
  
    
  
    
    
        

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
						
            <div class="element list ">
				            	        
	        		        	
	        		            	            			     		            	                 
						
							               			                 
								                   			                   			                   										<ul class="margin-none">
	                   				                   	
		                   			                   			                   			                   	<li><h6>
		                        

        



    
					<a href="/news/africa/as-military-power-shifts-in-libya-turkey-and-russia-control-its-fate-1.630992">
			<h6>As military power shifts in Libya, Turkey and Russia control its fate</h6>
		</a>
		
	  		                       								</h6></li>
		             			           			     		            	                 
						
							               			                 
								                   			                   			                   	
		                   			                   			                   			                   	<li><h6>
		                        

        



    
					<a href="/news/africa/balcony-church-gains-popularity-in-kenya-amid-pandemic-1.630968">
			<h6>Balcony church gains popularity in Kenya amid pandemic</h6>
		</a>
		
	  		                       								</h6></li>
		             			           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     	            </div>
			</div>
				
	  	
      
  
      				</div>
			</div>
		</div>
	</div>

										
																						
																							<div class="small-16 columns">
													<div class="row panel no-border tabs-see-more-box">
														<a href="http://www.stripes.com/news/africa">
																															<p class="tabs-see-more-url"><strong>See more Africa news</strong></p>
																													</a>
													</div>
												</div>
																														</div>
								</div>
							</div>
						</div>
									</div>
			</div>
		</div>
	</div>
	
 
      
    
    
        <hr class="fat"/>

      
    
    
        

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    		            	            	<a  href="https://www.stripes.com/news/veterans">
	            		<span class="round alert label right see-more">see more</span>
	        		</a>
	            	        	<h4 class="block-header">
	        			        			<a  href="https://www.stripes.com/news/veterans">
		        			<span>veterans</span>
	        			</a>
	        			    		</h4>
	    			
							        
            <div class="element list combolist">
				            		                	                	                    
	        		        	
	        		            	            	                 
						
							               			                 
								                   			                   				                       			                       			                       	<div class="row">
		                       		

        



    
					<div class="element teaser">
			
																		<div class="small-16 medium-6 large-6 columns show-for-medium-up">
						<a class="dimmer" href="/news/us/medal-of-honor-sought-for-navy-pilot-s-top-secret-actions-during-korean-war-1.630990">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='A 2018 graphic illustration used for a poster for the video production about Capt. E. Royce Williams&#39; historic mission during the Korean War.&#13;Graphic illustration by Austin Rooney/U.S. Defense Department' style='' alt='A 2018 graphic illustration used for a poster for the video production about Capt. E. Royce Williams&#39; historic mission during the Korean War.<br>Graphic illustration by Austin Rooney/U.S. Defense Department' class='left' src='/polopoly_fs/1.630991.1590246583!/image/image.jpg_gen/derivatives/300x200/image.jpg' />				
			
		    
						</a>
					</div>
					<div class="small-16 medium-6 large-6 columns hide-for-medium-up">
						<a class="dimmer" href="/news/us/medal-of-honor-sought-for-navy-pilot-s-top-secret-actions-during-korean-war-1.630990">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='A 2018 graphic illustration used for a poster for the video production about Capt. E. Royce Williams&#39; historic mission during the Korean War.&#13;Graphic illustration by Austin Rooney/U.S. Defense Department' style='' alt='A 2018 graphic illustration used for a poster for the video production about Capt. E. Royce Williams&#39; historic mission during the Korean War.<br>Graphic illustration by Austin Rooney/U.S. Defense Department' class='left' src='/polopoly_fs/1.630991.1590246583!/image/image.jpg_gen/derivatives/600x400/image.jpg' />				
			
		    
						</a>
					</div>
									
																	<div class="small-16 medium-10 large-10 columns">
													<a href="/news/us/medal-of-honor-sought-for-navy-pilot-s-top-secret-actions-during-korean-war-1.630990"><h4>Medal of Honor sought for Navy pilot's top secret actions during Korean War</h4></a>
							<p class="show-for-large-up">E. Royce Williams is being called a forgotten hero in a forgotten war — a military pilot whose heroic action was never fully recognized because his mission was filed away as top secret.</p>
												</div>
					        </div>
      		                       	</div>
		                       			                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
																										<hr>
									<div class="row">
										<div class="small-16 columns">
											<ul class="small-block-grid-1 medium-block-grid-2 large-block-grid-2">
										                       	
		                       	<li>
								

        



    
					<a href="/news/veterans/rip-through-the-heart-holyoke-soldiers-home-marks-somber-memorial-day-1.630998">
			<h6>'Rip through the heart': Holyoke Soldiers' Home marks somber Memorial Day</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
										                       	
		                       	<li>
								

        



    
					<a href="/news/us/iraq-war-veteran-wages-internal-battle-every-memorial-day-1.630985">
			<h6>Iraq War veteran wages internal battle every Memorial Day</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     			     		</ul>
		     		</div>
		     		</div>
		     	            </div>
			</div>
				
	  	
      
    
    
        <hr class="fat"/>

      
    
    
        		



		<div class="small-16 columns">
		<dl class="tabbedElementGroup tabs show-for-medium-up" data-tab>
												<dd class="active">
								
																			<a href="#tab3627951">coast guard</a>
													</dd>
												<dd>
								
																			<a href="#tab3627952">marine corps</a>
													</dd>
												<dd>
								
																			<a href="#tab3627953">air force</a>
													</dd>
												<dd>
								
																			<a href="#tab3627954">army</a>
													</dd>
												<dd>
								
																			<a href="#tab3627955">navy</a>
													</dd>
										<a href="https://www.stripes.com/news/branches">
					<span class="round alert label right see-more">see all</span>
				</a>
					</dl>

				<div class="tabs-content show-for-medium-up">
												<div id="tab3627951" class="content active">
								
					<div class="row">
						<div class="small-16 columns">
							<div class="row">
								

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
							        
            <div class="element list combolist">
				            		                	                	                    
	        		        	
	        		            	            	                 
						
							               			                 
								                   			                   				                       			                       			                       	<div class="row">
		                       		

        



    
					<div class="element teaser">
			
																		<div class="small-16 medium-6 large-6 columns show-for-medium-up">
						<a class="dimmer" href="/podcasts/military-matters/season-finale-information-warfare-and-how-to-avoid-being-manipulated-1.630808">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='U.S. Air Force Staff Sgt. Michael D. Szydlowski, a 57th Rescue Squadron pararescueman, reviews an article from Stars and Stripes dated November 24, 1998, at Aviano Air Base, Italy, on May 15, 2020. &#13;Ericka A. Woolever/U.S. Air Force' style='' alt='U.S. Air Force Staff Sgt. Michael D. Szydlowski, a 57th Rescue Squadron pararescueman, reviews an article from Stars and Stripes dated November 24, 1998, at Aviano Air Base, Italy, on May 15, 2020. <br>Ericka A. Woolever/U.S. Air Force' class='left' src='/polopoly_fs/1.630810.1590121010!/image/image.jpg_gen/derivatives/300x200/image.jpg' />				
			
		    
						</a>
					</div>
					<div class="small-16 medium-6 large-6 columns hide-for-medium-up">
						<a class="dimmer" href="/podcasts/military-matters/season-finale-information-warfare-and-how-to-avoid-being-manipulated-1.630808">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='U.S. Air Force Staff Sgt. Michael D. Szydlowski, a 57th Rescue Squadron pararescueman, reviews an article from Stars and Stripes dated November 24, 1998, at Aviano Air Base, Italy, on May 15, 2020. &#13;Ericka A. Woolever/U.S. Air Force' style='' alt='U.S. Air Force Staff Sgt. Michael D. Szydlowski, a 57th Rescue Squadron pararescueman, reviews an article from Stars and Stripes dated November 24, 1998, at Aviano Air Base, Italy, on May 15, 2020. <br>Ericka A. Woolever/U.S. Air Force' class='left' src='/polopoly_fs/1.630810.1590121010!/image/image.jpg_gen/derivatives/600x400/image.jpg' />				
			
		    
						</a>
					</div>
									
																	<div class="small-16 medium-10 large-10 columns">
													<a href="/podcasts/military-matters/season-finale-information-warfare-and-how-to-avoid-being-manipulated-1.630808"><h4>Season finale: Information warfare and how to avoid being manipulated</h4></a>
							<p class="show-for-large-up">In this season finale of the Military Matters podcast, hosts Rod Rodriguez and Desmon Farris shed light on the murky world of information warfare.</p>
												</div>
					        </div>
      		                       	</div>
		                       			                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
																										<hr>
									<div class="row">
										<div class="small-16 columns">
											<ul class="small-block-grid-1 medium-block-grid-2 large-block-grid-2">
										                       	
		                       	<li>
								

        



    
					<a href="/news/coast-guard/coast-guard-offloads-37-million-of-cocaine-in-san-diego-1.630637">
			<h6>Coast Guard offloads $37 million of cocaine in San Diego</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
										                       	
		                       	<li>
								

        



    
					<a href="/news/us/coast-guard-academy-class-of-2020-told-pandemic-will-prepare-them-to-be-leaders-1.630591">
			<h6>Coast Guard Academy Class of 2020 told pandemic will prepare them to be leaders</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     			     		</ul>
		     		</div>
		     		</div>
		     	            </div>
			</div>
				
	  									
																
																			<div class="small-16 columns">
											<div class="panel no-border tabs-see-more-box">
												<a href="http://www.stripes.com/news/coast-guard">
																											<p class="tabs-see-more-url"><strong>See more Coast Guard news</strong></p>
																									</a>
											</div>
										</div>
																								</div>
						</div>
					</div>
				</div>
												<div id="tab3627952" class="content">
								
					<div class="row">
						<div class="small-16 columns">
							<div class="row">
								

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
							        
            <div class="element list combolist">
				            		                	                	                    
	        		        	
	        		            	            	                 
						
							               			                 
								                   			                   				                       			                       			                       	<div class="row">
		                       		

        



    
					<div class="element teaser">
			
																		<div class="small-16 medium-6 large-6 columns show-for-medium-up">
						<a class="dimmer" href="/news/marine-corporal-receives-medal-for-saving-injured-motorist-1.630844">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='U.S. Marine Corps Maj. Gen. Robert Castellvi, right, presents the Navy and Marine Corps Commendation Medal to Cpl. Andrew C. Tate at Marine Corps Air Ground Combat Center, Twentynine Palms, Calif., May 4, 2020. Tate was awarded the medal for rescuing a motorist from an overturned car in May 2019.&#13;Conner R. Falb/U.S. Marine Corps' style='' alt='U.S. Marine Corps Maj. Gen. Robert Castellvi, right, presents the Navy and Marine Corps Commendation Medal to Cpl. Andrew C. Tate at Marine Corps Air Ground Combat Center, Twentynine Palms, Calif., May 4, 2020. Tate was awarded the medal for rescuing a motorist from an overturned car in May 2019.<br>Conner R. Falb/U.S. Marine Corps' class='left' src='/polopoly_fs/1.630845.1590146399!/image/image.jpg_gen/derivatives/300x200/image.jpg' />				
			
		    
						</a>
					</div>
					<div class="small-16 medium-6 large-6 columns hide-for-medium-up">
						<a class="dimmer" href="/news/marine-corporal-receives-medal-for-saving-injured-motorist-1.630844">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='U.S. Marine Corps Maj. Gen. Robert Castellvi, right, presents the Navy and Marine Corps Commendation Medal to Cpl. Andrew C. Tate at Marine Corps Air Ground Combat Center, Twentynine Palms, Calif., May 4, 2020. Tate was awarded the medal for rescuing a motorist from an overturned car in May 2019.&#13;Conner R. Falb/U.S. Marine Corps' style='' alt='U.S. Marine Corps Maj. Gen. Robert Castellvi, right, presents the Navy and Marine Corps Commendation Medal to Cpl. Andrew C. Tate at Marine Corps Air Ground Combat Center, Twentynine Palms, Calif., May 4, 2020. Tate was awarded the medal for rescuing a motorist from an overturned car in May 2019.<br>Conner R. Falb/U.S. Marine Corps' class='left' src='/polopoly_fs/1.630845.1590146399!/image/image.jpg_gen/derivatives/600x400/image.jpg' />				
			
		    
						</a>
					</div>
									
																	<div class="small-16 medium-10 large-10 columns">
													<a href="/news/marine-corporal-receives-medal-for-saving-injured-motorist-1.630844"><h4>Marine corporal receives medal for saving injured motorist</h4></a>
							<p class="show-for-large-up">When Cpl. Andrew Tate saw an overturned car at the side of the road in a national park in California, his Marine instincts and trauma aid training kicked in and allowed him to save the life of the badly injured driver, he said.</p>
												</div>
					        </div>
      		                       	</div>
		                       			                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
																										<hr>
									<div class="row">
										<div class="small-16 columns">
											<ul class="small-block-grid-1 medium-block-grid-2 large-block-grid-2">
										                       	
		                       	<li>
								

        



    
					<a href="/podcasts/military-matters/season-finale-information-warfare-and-how-to-avoid-being-manipulated-1.630808">
			<h6>Season finale: Information warfare and how to avoid being manipulated</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
										                       	
		                       	<li>
								

        



    
					<a href="/news/pacific/marines-trim-australia-rotational-force-to-1-200-marines-due-to-coronavirus-1.630803">
			<h6>Marines trim Australia rotational force to 1,200 Marines due to coronavirus</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     			     		</ul>
		     		</div>
		     		</div>
		     	            </div>
			</div>
				
	  									
																
																			<div class="small-16 columns">
											<div class="panel no-border tabs-see-more-box">
												<a href="http://www.stripes.com/news/marine-corps">
																											<p class="tabs-see-more-url"><strong>See more Marine Corps news</strong></p>
																									</a>
											</div>
										</div>
																								</div>
						</div>
					</div>
				</div>
												<div id="tab3627953" class="content">
								
					<div class="row">
						<div class="small-16 columns">
							<div class="row">
								

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
							        
            <div class="element list combolist">
				            		                	                	                    
	        		        	
	        		            	            	                 
						
							               			                 
								                   			                   				                       			                       			                       	<div class="row">
		                       		

        



    
					<div class="element teaser">
			
																		<div class="small-16 medium-6 large-6 columns show-for-medium-up">
						<a class="dimmer" href="/news/us/nasa-s-newest-test-pilots-are-veteran-astronauts-friends-1.630955">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='NASA astronauts Bob Behnken, left, and Doug Hurley, wearing SpaceX spacesuits, walk through the Crew Access Arm connecting the launch tower to the SpaceX Crew Dragon spacecraft during a dress rehearsal at NASA&#39;s Kennedy Space Center in Cape Canaveral, Fla., on Jan 17, 2020, For their May 27 mission, Hurley will be in charge of launch and landing and Behnken will oversee rendezvous and docking at the International Space Station.&#13;SpaceX /AP' style='' alt='NASA astronauts Bob Behnken, left, and Doug Hurley, wearing SpaceX spacesuits, walk through the Crew Access Arm connecting the launch tower to the SpaceX Crew Dragon spacecraft during a dress rehearsal at NASA&#39;s Kennedy Space Center in Cape Canaveral, Fla., on Jan 17, 2020, For their May 27 mission, Hurley will be in charge of launch and landing and Behnken will oversee rendezvous and docking at the International Space Station.<br>SpaceX /AP' class='left' src='/polopoly_fs/1.630956.1590183233!/image/image.jpg_gen/derivatives/300x200/image.jpg' />				
			
		    
						</a>
					</div>
					<div class="small-16 medium-6 large-6 columns hide-for-medium-up">
						<a class="dimmer" href="/news/us/nasa-s-newest-test-pilots-are-veteran-astronauts-friends-1.630955">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='NASA astronauts Bob Behnken, left, and Doug Hurley, wearing SpaceX spacesuits, walk through the Crew Access Arm connecting the launch tower to the SpaceX Crew Dragon spacecraft during a dress rehearsal at NASA&#39;s Kennedy Space Center in Cape Canaveral, Fla., on Jan 17, 2020, For their May 27 mission, Hurley will be in charge of launch and landing and Behnken will oversee rendezvous and docking at the International Space Station.&#13;SpaceX /AP' style='' alt='NASA astronauts Bob Behnken, left, and Doug Hurley, wearing SpaceX spacesuits, walk through the Crew Access Arm connecting the launch tower to the SpaceX Crew Dragon spacecraft during a dress rehearsal at NASA&#39;s Kennedy Space Center in Cape Canaveral, Fla., on Jan 17, 2020, For their May 27 mission, Hurley will be in charge of launch and landing and Behnken will oversee rendezvous and docking at the International Space Station.<br>SpaceX /AP' class='left' src='/polopoly_fs/1.630956.1590183233!/image/image.jpg_gen/derivatives/600x400/image.jpg' />				
			
		    
						</a>
					</div>
									
																	<div class="small-16 medium-10 large-10 columns">
													<a href="/news/us/nasa-s-newest-test-pilots-are-veteran-astronauts-friends-1.630955"><h4>NASA's newest test pilots are veteran astronauts, friends</h4></a>
							<p class="show-for-large-up">The two astronauts who will test drive SpaceX's brand new rocketship are classmates and friends, veteran spacefliers married to veteran spacefliers, and fathers of young sons.</p>
												</div>
					        </div>
      		                       	</div>
		                       			                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
																										<hr>
									<div class="row">
										<div class="small-16 columns">
											<ul class="small-block-grid-1 medium-block-grid-2 large-block-grid-2">
										                       	
		                       	<li>
								

        



    
					<a href="/news/us/no-longer-too-short-to-fly-air-force-lifts-height-restrictions-for-pilots-1.630941">
			<h6>No longer too short to fly: Air Force lifts height restrictions for pilots</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
										                       	
		                       	<li>
								

        



    
					<a href="/news/air-force/air-force-cancels-fitness-assessments-over-coronavirus-concerns-1.630812">
			<h6>Air Force cancels fitness assessments over coronavirus concerns</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     			     		</ul>
		     		</div>
		     		</div>
		     	            </div>
			</div>
				
	  									
																
																			<div class="small-16 columns">
											<div class="panel no-border tabs-see-more-box">
												<a href="http://www.stripes.com/news/air-force">
																											<p class="tabs-see-more-url"><strong>See more Air Force news</strong></p>
																									</a>
											</div>
										</div>
																								</div>
						</div>
					</div>
				</div>
												<div id="tab3627954" class="content">
								
					<div class="row">
						<div class="small-16 columns">
							<div class="row">
								

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
							        
            <div class="element list combolist">
				            		                	                	                    
	        		        	
	        		            	            	                 
						
							               			                 
								                   			                   				                       			                       			                       	<div class="row">
		                       		

        



    
					<div class="element teaser">
			
																		<div class="small-16 medium-6 large-6 columns show-for-medium-up">
						<a class="dimmer" href="/news/army/new-army-lieutenant-from-virginia-represents-military-at-white-house-graduation-ceremony-1.631009">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='Second Lt. Lauren Shappell of Virginia was chosen to represent military graduates at a White House ceremony Friday to honor students from the class of 2020. &#13;Lauren Shappell' style='' alt='Second Lt. Lauren Shappell of Virginia was chosen to represent military graduates at a White House ceremony Friday to honor students from the class of 2020. <br>Lauren Shappell' class='left' src='/polopoly_fs/1.631012.1590255435!/image/image.jpeg_gen/derivatives/300x200/image.jpeg' />				
			
		    
						</a>
					</div>
					<div class="small-16 medium-6 large-6 columns hide-for-medium-up">
						<a class="dimmer" href="/news/army/new-army-lieutenant-from-virginia-represents-military-at-white-house-graduation-ceremony-1.631009">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='Second Lt. Lauren Shappell of Virginia was chosen to represent military graduates at a White House ceremony Friday to honor students from the class of 2020. &#13;Lauren Shappell' style='' alt='Second Lt. Lauren Shappell of Virginia was chosen to represent military graduates at a White House ceremony Friday to honor students from the class of 2020. <br>Lauren Shappell' class='left' src='/polopoly_fs/1.631012.1590255435!/image/image.jpeg_gen/derivatives/600x400/image.jpeg' />				
			
		    
						</a>
					</div>
									
																	<div class="small-16 medium-10 large-10 columns">
													<a href="/news/army/new-army-lieutenant-from-virginia-represents-military-at-white-house-graduation-ceremony-1.631009"><h4>New Army lieutenant from Virginia represents military at White House graduation ceremony</h4></a>
							<p class="show-for-large-up">As a newly commissioned second lieutenant in the Army, Lauren Shappell’s first assignment attracted a call of support from a four-star general. Her mission: to represent the military at a White House commencement ceremony.</p>
												</div>
					        </div>
      		                       	</div>
		                       			                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
																										<hr>
									<div class="row">
										<div class="small-16 columns">
											<ul class="small-block-grid-1 medium-block-grid-2 large-block-grid-2">
										                       	
		                       	<li>
								

        



    
					<a href="/news/us/remains-of-soldier-who-died-in-iraq-returning-to-indiana-1.631000">
			<h6>Remains of soldier who died in Iraq returning to Indiana</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
										                       	
		                       	<li>
								

        



    
					<a href="/news/us/us-army-plans-massive-recruiting-drive-for-summer-1.630967">
			<h6>US Army plans massive recruiting drive for summer</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     			     		</ul>
		     		</div>
		     		</div>
		     	            </div>
			</div>
				
	  									
																
																			<div class="small-16 columns">
											<div class="panel no-border tabs-see-more-box">
												<a href="http://www.stripes.com/news/army">
																											<p class="tabs-see-more-url"><strong>See more Army news</strong></p>
																									</a>
											</div>
										</div>
																								</div>
						</div>
					</div>
				</div>
												<div id="tab3627955" class="content">
								
					<div class="row">
						<div class="small-16 columns">
							<div class="row">
								

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
							        
            <div class="element list combolist">
				            		                	                	                    
	        		        	
	        		            	            	                 
						
							               			                 
								                   			                   				                       			                       			                       	<div class="row">
		                       		

        



    
					<div class="element teaser">
			
																		<div class="small-16 medium-6 large-6 columns show-for-medium-up">
						<a class="dimmer" href="/news/us/75-years-later-memorial-dedicated-to-navy-vessel-sunk-by-u-boat-off-coast-of-maine-1.630988">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='This is the USS Eagle 2 (PE-2) on builder&rsquo;s trials in 1918. An identical sister ship, USS Eagle 56 (PE-56), was lost due to a mysterious explosion April 23, 1945.&#13;U.S. Navy' style='' alt='This is the USS Eagle 2 (PE-2) on builder&rsquo;s trials in 1918. An identical sister ship, USS Eagle 56 (PE-56), was lost due to a mysterious explosion April 23, 1945.<br>U.S. Navy' class='left' src='/polopoly_fs/1.630989.1590246018!/image/image.jpg_gen/derivatives/300x200/image.jpg' />				
			
		    
						</a>
					</div>
					<div class="small-16 medium-6 large-6 columns hide-for-medium-up">
						<a class="dimmer" href="/news/us/75-years-later-memorial-dedicated-to-navy-vessel-sunk-by-u-boat-off-coast-of-maine-1.630988">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='This is the USS Eagle 2 (PE-2) on builder&rsquo;s trials in 1918. An identical sister ship, USS Eagle 56 (PE-56), was lost due to a mysterious explosion April 23, 1945.&#13;U.S. Navy' style='' alt='This is the USS Eagle 2 (PE-2) on builder&rsquo;s trials in 1918. An identical sister ship, USS Eagle 56 (PE-56), was lost due to a mysterious explosion April 23, 1945.<br>U.S. Navy' class='left' src='/polopoly_fs/1.630989.1590246018!/image/image.jpg_gen/derivatives/600x400/image.jpg' />				
			
		    
						</a>
					</div>
									
																	<div class="small-16 medium-10 large-10 columns">
													<a href="/news/us/75-years-later-memorial-dedicated-to-navy-vessel-sunk-by-u-boat-off-coast-of-maine-1.630988"><h4>75 years later, memorial dedicated to Navy vessel sunk by U-boat off coast of Maine</h4></a>
							<p class="show-for-large-up">National Guard troops based in Western New York and elsewhere around the country rushed to the nation's aid when the Covid-19 pandemic struck – but now the federal government wants to cut short their deployments one day before many of them qualify for valuable federal benefits.</p>
												</div>
					        </div>
      		                       	</div>
		                       			                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
																										<hr>
									<div class="row">
										<div class="small-16 columns">
											<ul class="small-block-grid-1 medium-block-grid-2 large-block-grid-2">
										                       	
		                       	<li>
								

        



    
					<a href="/news/navy/naval-academy-class-gets-sendoff-with-words-from-dignitaries-celebrities-and-former-pow-1.630949">
			<h6>Naval Academy Class gets sendoff with words from dignitaries, celebrities and former POW</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
										                       	
		                       	<li>
								

        



    
					<a href="/news/navy/navy-trumpets-seven-of-its-11-aircraft-carriers-now-underway-after-beating-back-coronavirus-1.630965">
			<h6>Navy trumpets seven of its 11 aircraft carriers now underway after beating back coronavirus</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     			     		</ul>
		     		</div>
		     		</div>
		     	            </div>
			</div>
				
	  									
																
																			<div class="small-16 columns">
											<div class="panel no-border tabs-see-more-box">
												<a href="http://www.stripes.com/news/navy">
																											<p class="tabs-see-more-url"><strong>See more Navy news</strong></p>
																									</a>
											</div>
										</div>
																								</div>
						</div>
					</div>
				</div>
					</div>
		
				<div class="row hide-for-medium-up small-tab">
			<div class="small-16 columns">
								<a data-dropdown="drop-362795" aria-controls="drop-362795" aria-expanded="false" aria-autoclose="true" class="button tiny right picker">choose&nbsp;<i class="fa fa-chevron-circle-down fa-fw"></i></a>
				<div id="drop-362795" data-dropdown-content class="f-dropdown content" aria-hidden="true" tabindex="-1">
					<dl class="tabs vertical" data-tab>
																					<dd class="active">
														
																															<a href="#tab3627951">coast guard</a>
																						</dd>
																					<dd>
														
																															<a href="#tab3627952">marine corps</a>
																						</dd>
																					<dd>
														
																															<a href="#tab3627953">air force</a>
																						</dd>
																					<dd>
														
																															<a href="#tab3627954">army</a>
																						</dd>
																					<dd>
														
																															<a href="#tab3627955">navy</a>
																						</dd>
											</dl>
				</div>
				
													<a href="https://www.stripes.com/news/branches">
						<h4 class="block-header"><span>military branches</span></h4>
					</a>
								<div class="tabs-content vertical hide-for-medium-up">
																		<div id="tab3627951" class="content active">
									
							<div class="row">
								<div class="small-16 columns">
									<div class="row">
										

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
							        
            <div class="element list combolist">
				            		                	                	                    
	        		        	
	        		            	            	                 
						
							               			                 
								                   			                   				                       			                       			                       	<div class="row">
		                       		

        



    
					<div class="element teaser">
			
																		<div class="small-16 medium-6 large-6 columns show-for-medium-up">
						<a class="dimmer" href="/podcasts/military-matters/season-finale-information-warfare-and-how-to-avoid-being-manipulated-1.630808">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='U.S. Air Force Staff Sgt. Michael D. Szydlowski, a 57th Rescue Squadron pararescueman, reviews an article from Stars and Stripes dated November 24, 1998, at Aviano Air Base, Italy, on May 15, 2020. &#13;Ericka A. Woolever/U.S. Air Force' style='' alt='U.S. Air Force Staff Sgt. Michael D. Szydlowski, a 57th Rescue Squadron pararescueman, reviews an article from Stars and Stripes dated November 24, 1998, at Aviano Air Base, Italy, on May 15, 2020. <br>Ericka A. Woolever/U.S. Air Force' class='left' src='/polopoly_fs/1.630810.1590121010!/image/image.jpg_gen/derivatives/300x200/image.jpg' />				
			
		    
						</a>
					</div>
					<div class="small-16 medium-6 large-6 columns hide-for-medium-up">
						<a class="dimmer" href="/podcasts/military-matters/season-finale-information-warfare-and-how-to-avoid-being-manipulated-1.630808">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='U.S. Air Force Staff Sgt. Michael D. Szydlowski, a 57th Rescue Squadron pararescueman, reviews an article from Stars and Stripes dated November 24, 1998, at Aviano Air Base, Italy, on May 15, 2020. &#13;Ericka A. Woolever/U.S. Air Force' style='' alt='U.S. Air Force Staff Sgt. Michael D. Szydlowski, a 57th Rescue Squadron pararescueman, reviews an article from Stars and Stripes dated November 24, 1998, at Aviano Air Base, Italy, on May 15, 2020. <br>Ericka A. Woolever/U.S. Air Force' class='left' src='/polopoly_fs/1.630810.1590121010!/image/image.jpg_gen/derivatives/600x400/image.jpg' />				
			
		    
						</a>
					</div>
									
																	<div class="small-16 medium-10 large-10 columns">
													<a href="/podcasts/military-matters/season-finale-information-warfare-and-how-to-avoid-being-manipulated-1.630808"><h4>Season finale: Information warfare and how to avoid being manipulated</h4></a>
							<p class="show-for-large-up">In this season finale of the Military Matters podcast, hosts Rod Rodriguez and Desmon Farris shed light on the murky world of information warfare.</p>
												</div>
					        </div>
      		                       	</div>
		                       			                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
																										<hr>
									<div class="row">
										<div class="small-16 columns">
											<ul class="small-block-grid-1 medium-block-grid-2 large-block-grid-2">
										                       	
		                       	<li>
								

        



    
					<a href="/news/coast-guard/coast-guard-offloads-37-million-of-cocaine-in-san-diego-1.630637">
			<h6>Coast Guard offloads $37 million of cocaine in San Diego</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
										                       	
		                       	<li>
								

        



    
					<a href="/news/us/coast-guard-academy-class-of-2020-told-pandemic-will-prepare-them-to-be-leaders-1.630591">
			<h6>Coast Guard Academy Class of 2020 told pandemic will prepare them to be leaders</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     			     		</ul>
		     		</div>
		     		</div>
		     	            </div>
			</div>
				
	  											
																						
																							<div class="small-16 columns">
													<div class="row panel no-border tabs-see-more-box">
														<a href="http://www.stripes.com/news/coast-guard">
																															<p class="tabs-see-more-url"><strong>See more Coast Guard news</strong></p>
																													</a>
													</div>
												</div>
																														</div>
								</div>
							</div>
						</div>
																		<div id="tab3627952" class="content">
									
							<div class="row">
								<div class="small-16 columns">
									<div class="row">
										

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
							        
            <div class="element list combolist">
				            		                	                	                    
	        		        	
	        		            	            	                 
						
							               			                 
								                   			                   				                       			                       			                       	<div class="row">
		                       		

        



    
					<div class="element teaser">
			
																		<div class="small-16 medium-6 large-6 columns show-for-medium-up">
						<a class="dimmer" href="/news/marine-corporal-receives-medal-for-saving-injured-motorist-1.630844">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='U.S. Marine Corps Maj. Gen. Robert Castellvi, right, presents the Navy and Marine Corps Commendation Medal to Cpl. Andrew C. Tate at Marine Corps Air Ground Combat Center, Twentynine Palms, Calif., May 4, 2020. Tate was awarded the medal for rescuing a motorist from an overturned car in May 2019.&#13;Conner R. Falb/U.S. Marine Corps' style='' alt='U.S. Marine Corps Maj. Gen. Robert Castellvi, right, presents the Navy and Marine Corps Commendation Medal to Cpl. Andrew C. Tate at Marine Corps Air Ground Combat Center, Twentynine Palms, Calif., May 4, 2020. Tate was awarded the medal for rescuing a motorist from an overturned car in May 2019.<br>Conner R. Falb/U.S. Marine Corps' class='left' src='/polopoly_fs/1.630845.1590146399!/image/image.jpg_gen/derivatives/300x200/image.jpg' />				
			
		    
						</a>
					</div>
					<div class="small-16 medium-6 large-6 columns hide-for-medium-up">
						<a class="dimmer" href="/news/marine-corporal-receives-medal-for-saving-injured-motorist-1.630844">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='U.S. Marine Corps Maj. Gen. Robert Castellvi, right, presents the Navy and Marine Corps Commendation Medal to Cpl. Andrew C. Tate at Marine Corps Air Ground Combat Center, Twentynine Palms, Calif., May 4, 2020. Tate was awarded the medal for rescuing a motorist from an overturned car in May 2019.&#13;Conner R. Falb/U.S. Marine Corps' style='' alt='U.S. Marine Corps Maj. Gen. Robert Castellvi, right, presents the Navy and Marine Corps Commendation Medal to Cpl. Andrew C. Tate at Marine Corps Air Ground Combat Center, Twentynine Palms, Calif., May 4, 2020. Tate was awarded the medal for rescuing a motorist from an overturned car in May 2019.<br>Conner R. Falb/U.S. Marine Corps' class='left' src='/polopoly_fs/1.630845.1590146399!/image/image.jpg_gen/derivatives/600x400/image.jpg' />				
			
		    
						</a>
					</div>
									
																	<div class="small-16 medium-10 large-10 columns">
													<a href="/news/marine-corporal-receives-medal-for-saving-injured-motorist-1.630844"><h4>Marine corporal receives medal for saving injured motorist</h4></a>
							<p class="show-for-large-up">When Cpl. Andrew Tate saw an overturned car at the side of the road in a national park in California, his Marine instincts and trauma aid training kicked in and allowed him to save the life of the badly injured driver, he said.</p>
												</div>
					        </div>
      		                       	</div>
		                       			                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
																										<hr>
									<div class="row">
										<div class="small-16 columns">
											<ul class="small-block-grid-1 medium-block-grid-2 large-block-grid-2">
										                       	
		                       	<li>
								

        



    
					<a href="/podcasts/military-matters/season-finale-information-warfare-and-how-to-avoid-being-manipulated-1.630808">
			<h6>Season finale: Information warfare and how to avoid being manipulated</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
										                       	
		                       	<li>
								

        



    
					<a href="/news/pacific/marines-trim-australia-rotational-force-to-1-200-marines-due-to-coronavirus-1.630803">
			<h6>Marines trim Australia rotational force to 1,200 Marines due to coronavirus</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     			     		</ul>
		     		</div>
		     		</div>
		     	            </div>
			</div>
				
	  											
																						
																							<div class="small-16 columns">
													<div class="row panel no-border tabs-see-more-box">
														<a href="http://www.stripes.com/news/marine-corps">
																															<p class="tabs-see-more-url"><strong>See more Marine Corps news</strong></p>
																													</a>
													</div>
												</div>
																														</div>
								</div>
							</div>
						</div>
																		<div id="tab3627953" class="content">
									
							<div class="row">
								<div class="small-16 columns">
									<div class="row">
										

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
							        
            <div class="element list combolist">
				            		                	                	                    
	        		        	
	        		            	            	                 
						
							               			                 
								                   			                   				                       			                       			                       	<div class="row">
		                       		

        



    
					<div class="element teaser">
			
																		<div class="small-16 medium-6 large-6 columns show-for-medium-up">
						<a class="dimmer" href="/news/us/nasa-s-newest-test-pilots-are-veteran-astronauts-friends-1.630955">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='NASA astronauts Bob Behnken, left, and Doug Hurley, wearing SpaceX spacesuits, walk through the Crew Access Arm connecting the launch tower to the SpaceX Crew Dragon spacecraft during a dress rehearsal at NASA&#39;s Kennedy Space Center in Cape Canaveral, Fla., on Jan 17, 2020, For their May 27 mission, Hurley will be in charge of launch and landing and Behnken will oversee rendezvous and docking at the International Space Station.&#13;SpaceX /AP' style='' alt='NASA astronauts Bob Behnken, left, and Doug Hurley, wearing SpaceX spacesuits, walk through the Crew Access Arm connecting the launch tower to the SpaceX Crew Dragon spacecraft during a dress rehearsal at NASA&#39;s Kennedy Space Center in Cape Canaveral, Fla., on Jan 17, 2020, For their May 27 mission, Hurley will be in charge of launch and landing and Behnken will oversee rendezvous and docking at the International Space Station.<br>SpaceX /AP' class='left' src='/polopoly_fs/1.630956.1590183233!/image/image.jpg_gen/derivatives/300x200/image.jpg' />				
			
		    
						</a>
					</div>
					<div class="small-16 medium-6 large-6 columns hide-for-medium-up">
						<a class="dimmer" href="/news/us/nasa-s-newest-test-pilots-are-veteran-astronauts-friends-1.630955">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='NASA astronauts Bob Behnken, left, and Doug Hurley, wearing SpaceX spacesuits, walk through the Crew Access Arm connecting the launch tower to the SpaceX Crew Dragon spacecraft during a dress rehearsal at NASA&#39;s Kennedy Space Center in Cape Canaveral, Fla., on Jan 17, 2020, For their May 27 mission, Hurley will be in charge of launch and landing and Behnken will oversee rendezvous and docking at the International Space Station.&#13;SpaceX /AP' style='' alt='NASA astronauts Bob Behnken, left, and Doug Hurley, wearing SpaceX spacesuits, walk through the Crew Access Arm connecting the launch tower to the SpaceX Crew Dragon spacecraft during a dress rehearsal at NASA&#39;s Kennedy Space Center in Cape Canaveral, Fla., on Jan 17, 2020, For their May 27 mission, Hurley will be in charge of launch and landing and Behnken will oversee rendezvous and docking at the International Space Station.<br>SpaceX /AP' class='left' src='/polopoly_fs/1.630956.1590183233!/image/image.jpg_gen/derivatives/600x400/image.jpg' />				
			
		    
						</a>
					</div>
									
																	<div class="small-16 medium-10 large-10 columns">
													<a href="/news/us/nasa-s-newest-test-pilots-are-veteran-astronauts-friends-1.630955"><h4>NASA's newest test pilots are veteran astronauts, friends</h4></a>
							<p class="show-for-large-up">The two astronauts who will test drive SpaceX's brand new rocketship are classmates and friends, veteran spacefliers married to veteran spacefliers, and fathers of young sons.</p>
												</div>
					        </div>
      		                       	</div>
		                       			                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
																										<hr>
									<div class="row">
										<div class="small-16 columns">
											<ul class="small-block-grid-1 medium-block-grid-2 large-block-grid-2">
										                       	
		                       	<li>
								

        



    
					<a href="/news/us/no-longer-too-short-to-fly-air-force-lifts-height-restrictions-for-pilots-1.630941">
			<h6>No longer too short to fly: Air Force lifts height restrictions for pilots</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
										                       	
		                       	<li>
								

        



    
					<a href="/news/air-force/air-force-cancels-fitness-assessments-over-coronavirus-concerns-1.630812">
			<h6>Air Force cancels fitness assessments over coronavirus concerns</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     			     		</ul>
		     		</div>
		     		</div>
		     	            </div>
			</div>
				
	  											
																						
																							<div class="small-16 columns">
													<div class="row panel no-border tabs-see-more-box">
														<a href="http://www.stripes.com/news/air-force">
																															<p class="tabs-see-more-url"><strong>See more Air Force news</strong></p>
																													</a>
													</div>
												</div>
																														</div>
								</div>
							</div>
						</div>
																		<div id="tab3627954" class="content">
									
							<div class="row">
								<div class="small-16 columns">
									<div class="row">
										

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
							        
            <div class="element list combolist">
				            		                	                	                    
	        		        	
	        		            	            	                 
						
							               			                 
								                   			                   				                       			                       			                       	<div class="row">
		                       		

        



    
					<div class="element teaser">
			
																		<div class="small-16 medium-6 large-6 columns show-for-medium-up">
						<a class="dimmer" href="/news/army/new-army-lieutenant-from-virginia-represents-military-at-white-house-graduation-ceremony-1.631009">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='Second Lt. Lauren Shappell of Virginia was chosen to represent military graduates at a White House ceremony Friday to honor students from the class of 2020. &#13;Lauren Shappell' style='' alt='Second Lt. Lauren Shappell of Virginia was chosen to represent military graduates at a White House ceremony Friday to honor students from the class of 2020. <br>Lauren Shappell' class='left' src='/polopoly_fs/1.631012.1590255435!/image/image.jpeg_gen/derivatives/300x200/image.jpeg' />				
			
		    
						</a>
					</div>
					<div class="small-16 medium-6 large-6 columns hide-for-medium-up">
						<a class="dimmer" href="/news/army/new-army-lieutenant-from-virginia-represents-military-at-white-house-graduation-ceremony-1.631009">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='Second Lt. Lauren Shappell of Virginia was chosen to represent military graduates at a White House ceremony Friday to honor students from the class of 2020. &#13;Lauren Shappell' style='' alt='Second Lt. Lauren Shappell of Virginia was chosen to represent military graduates at a White House ceremony Friday to honor students from the class of 2020. <br>Lauren Shappell' class='left' src='/polopoly_fs/1.631012.1590255435!/image/image.jpeg_gen/derivatives/600x400/image.jpeg' />				
			
		    
						</a>
					</div>
									
																	<div class="small-16 medium-10 large-10 columns">
													<a href="/news/army/new-army-lieutenant-from-virginia-represents-military-at-white-house-graduation-ceremony-1.631009"><h4>New Army lieutenant from Virginia represents military at White House graduation ceremony</h4></a>
							<p class="show-for-large-up">As a newly commissioned second lieutenant in the Army, Lauren Shappell’s first assignment attracted a call of support from a four-star general. Her mission: to represent the military at a White House commencement ceremony.</p>
												</div>
					        </div>
      		                       	</div>
		                       			                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
																										<hr>
									<div class="row">
										<div class="small-16 columns">
											<ul class="small-block-grid-1 medium-block-grid-2 large-block-grid-2">
										                       	
		                       	<li>
								

        



    
					<a href="/news/us/remains-of-soldier-who-died-in-iraq-returning-to-indiana-1.631000">
			<h6>Remains of soldier who died in Iraq returning to Indiana</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
										                       	
		                       	<li>
								

        



    
					<a href="/news/us/us-army-plans-massive-recruiting-drive-for-summer-1.630967">
			<h6>US Army plans massive recruiting drive for summer</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     			     		</ul>
		     		</div>
		     		</div>
		     	            </div>
			</div>
				
	  											
																						
																							<div class="small-16 columns">
													<div class="row panel no-border tabs-see-more-box">
														<a href="http://www.stripes.com/news/army">
																															<p class="tabs-see-more-url"><strong>See more Army news</strong></p>
																													</a>
													</div>
												</div>
																														</div>
								</div>
							</div>
						</div>
																		<div id="tab3627955" class="content">
									
							<div class="row">
								<div class="small-16 columns">
									<div class="row">
										

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
							        
            <div class="element list combolist">
				            		                	                	                    
	        		        	
	        		            	            	                 
						
							               			                 
								                   			                   				                       			                       			                       	<div class="row">
		                       		

        



    
					<div class="element teaser">
			
																		<div class="small-16 medium-6 large-6 columns show-for-medium-up">
						<a class="dimmer" href="/news/us/75-years-later-memorial-dedicated-to-navy-vessel-sunk-by-u-boat-off-coast-of-maine-1.630988">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='This is the USS Eagle 2 (PE-2) on builder&rsquo;s trials in 1918. An identical sister ship, USS Eagle 56 (PE-56), was lost due to a mysterious explosion April 23, 1945.&#13;U.S. Navy' style='' alt='This is the USS Eagle 2 (PE-2) on builder&rsquo;s trials in 1918. An identical sister ship, USS Eagle 56 (PE-56), was lost due to a mysterious explosion April 23, 1945.<br>U.S. Navy' class='left' src='/polopoly_fs/1.630989.1590246018!/image/image.jpg_gen/derivatives/300x200/image.jpg' />				
			
		    
						</a>
					</div>
					<div class="small-16 medium-6 large-6 columns hide-for-medium-up">
						<a class="dimmer" href="/news/us/75-years-later-memorial-dedicated-to-navy-vessel-sunk-by-u-boat-off-coast-of-maine-1.630988">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='This is the USS Eagle 2 (PE-2) on builder&rsquo;s trials in 1918. An identical sister ship, USS Eagle 56 (PE-56), was lost due to a mysterious explosion April 23, 1945.&#13;U.S. Navy' style='' alt='This is the USS Eagle 2 (PE-2) on builder&rsquo;s trials in 1918. An identical sister ship, USS Eagle 56 (PE-56), was lost due to a mysterious explosion April 23, 1945.<br>U.S. Navy' class='left' src='/polopoly_fs/1.630989.1590246018!/image/image.jpg_gen/derivatives/600x400/image.jpg' />				
			
		    
						</a>
					</div>
									
																	<div class="small-16 medium-10 large-10 columns">
													<a href="/news/us/75-years-later-memorial-dedicated-to-navy-vessel-sunk-by-u-boat-off-coast-of-maine-1.630988"><h4>75 years later, memorial dedicated to Navy vessel sunk by U-boat off coast of Maine</h4></a>
							<p class="show-for-large-up">National Guard troops based in Western New York and elsewhere around the country rushed to the nation's aid when the Covid-19 pandemic struck – but now the federal government wants to cut short their deployments one day before many of them qualify for valuable federal benefits.</p>
												</div>
					        </div>
      		                       	</div>
		                       			                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
																										<hr>
									<div class="row">
										<div class="small-16 columns">
											<ul class="small-block-grid-1 medium-block-grid-2 large-block-grid-2">
										                       	
		                       	<li>
								

        



    
					<a href="/news/navy/naval-academy-class-gets-sendoff-with-words-from-dignitaries-celebrities-and-former-pow-1.630949">
			<h6>Naval Academy Class gets sendoff with words from dignitaries, celebrities and former POW</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            	                 
						
							               			                 
								                   			                   				                   		
		                   				                       			                       			                       	
										                       	
		                       	<li>
								

        



    
					<a href="/news/navy/navy-trumpets-seven-of-its-11-aircraft-carriers-now-underway-after-beating-back-coronavirus-1.630965">
			<h6>Navy trumpets seven of its 11 aircraft carriers now underway after beating back coronavirus</h6>
		</a>
		
	  		                       			                       	</li>
		                   		             				           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     			     		</ul>
		     		</div>
		     		</div>
		     	            </div>
			</div>
				
	  											
																						
																							<div class="small-16 columns">
													<div class="row panel no-border tabs-see-more-box">
														<a href="http://www.stripes.com/news/navy">
																															<p class="tabs-see-more-url"><strong>See more Navy news</strong></p>
																													</a>
													</div>
												</div>
																														</div>
								</div>
							</div>
						</div>
									</div>
			</div>
		</div>
	</div>
	
 
      
    
    
        <hr class="fat"/>

      
    
    
        		



		<div class="small-16 columns">
		<dl class="tabbedElementGroup tabs show-for-medium-up" data-tab>
												<dd class="active">
								
																			<a href="#tab4104991">sports</a>
													</dd>
										<a href="http://www.stripes.com/sports">
					<span class="round alert label right see-more">see all</span>
				</a>
					</dl>

				<div class="tabs-content show-for-medium-up">
												<div id="tab4104991" class="content active">
								
					<div class="row">
						<div class="small-16 columns">
							<div class="row">
								

  
	
	<div class="small-16 columns">
					
		<div class="container twoColumnsLeftHeavy row">
							<div class="small-16 medium-16 large-12 columns">
			
				<div class="row">
    				
                  
    
  
    
  
    
    
        

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
							        
            <div class="element list teaserlist">
				            	        
	        		        	
	        		            	            	                 
						
							               			                 
							                   			                   									<div class="row">
																

        



    
					<div class="element teaser">
			
																		<div class="small-6 medium-6 large-6 columns">
						<a class="dimmer" href="/news/us/old-1918-pandemic-is-a-murky-guide-for-sports-1.630644">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='Fans watch a Georgia Tech home game during the 1918 college football season. &#13;Photo provided by Georgia Tech alumnus Andy McNeil /Thomas Carter/AP' style='' alt='Fans watch a Georgia Tech home game during the 1918 college football season. <br>Photo provided by Georgia Tech alumnus Andy McNeil /Thomas Carter/AP' class='left' src='/polopoly_fs/1.630646.1590072743!/image/image.jpg_gen/derivatives/box_210/image.jpg' />				
			
		    
						</a>
					</div>
									
																	<div class="small-10 medium-10 large-10 columns">
													<a href="/news/us/old-1918-pandemic-is-a-murky-guide-for-sports-1.630644"><h4>Old 1918 pandemic is a murky guide for sports</h4></a>
							<p class="show-for-large-up">Decades before tailgates, prime-time kickoffs and billions in program-supporting TV money, the ethos of the die-hard college football fan was not much different than today: Risks be damned, we're going to the game. And once fans are allowed back in stadiums, history has shown that football could come back strong.</p>
												</div>
					        </div>
      							</div>
								           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     	            </div>
			</div>
				
	  	
      
  
      				</div>
          	</div>
          	<div class="small-16 columns hide-for-large-up">
          		<hr>
          	</div>

          	          		<div class="small-16 medium-16 large-4 columns">
          	
				<div class="row">
    				
                  
    
  
    
  
    
    
        

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
						
            <div class="element list ">
				            	        
	        		        	
	        		            	            			     		            	                 
						
							               			                 
								                   			                   			                   										<ul class="margin-none">
	                   				                   	
		                   			                   			                   			                   	<li><h6>
		                        

        



    
					<a href="/news/us/nfl-studying-helmet-face-guard-that-works-like-surgical-mask-1.630508">
			<h6>NFL studying helmet face guard that works like surgical mask </h6>
		</a>
		
	  		                       								</h6></li>
		             			           			     		            	                 
						
							               			                 
								                   			                   			                   	
		                   			                   			                   			                   	<li><h6>
		                        

        



    
					<a href="/sports/us/nascar-ready-to-fire-up-its-engines-sunday-hoping-to-lead-sports-return-from-quarantine-1.630002">
			<h6>NASCAR ready to fire up its engines Sunday, hoping to lead sports' return from quarantine</h6>
		</a>
		
	  		                       								</h6></li>
		             			           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     	            </div>
			</div>
				
	  	
      
  
      				</div>
			</div>
		</div>
	</div>

								
																
																								</div>
						</div>
					</div>
				</div>
					</div>
		
				<div class="row hide-for-medium-up small-tab">
			<div class="small-16 columns">
								<a data-dropdown="drop-410499" aria-controls="drop-410499" aria-expanded="false" aria-autoclose="true" class="button tiny right picker">choose&nbsp;<i class="fa fa-chevron-circle-down fa-fw"></i></a>
				<div id="drop-410499" data-dropdown-content class="f-dropdown content" aria-hidden="true" tabindex="-1">
					<dl class="tabs vertical" data-tab>
																					<dd class="active">
														
																															<a href="#tab4104991">sports</a>
																						</dd>
											</dl>
				</div>
				
													<a href="http://www.stripes.com/sports">
						<h4 class="block-header"><span>Sports</span></h4>
					</a>
								<div class="tabs-content vertical hide-for-medium-up">
																		<div id="tab4104991" class="content active">
									
							<div class="row">
								<div class="small-16 columns">
									<div class="row">
										

  
	
	<div class="small-16 columns">
					
		<div class="container twoColumnsLeftHeavy row">
							<div class="small-16 medium-16 large-12 columns">
			
				<div class="row">
    				
                  
    
  
    
  
    
    
        

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
							        
            <div class="element list teaserlist">
				            	        
	        		        	
	        		            	            	                 
						
							               			                 
							                   			                   									<div class="row">
																

        



    
					<div class="element teaser">
			
																		<div class="small-6 medium-6 large-6 columns">
						<a class="dimmer" href="/news/us/old-1918-pandemic-is-a-murky-guide-for-sports-1.630644">
														

        

    		
        
	        
	            
	        
                    	    
									<img title='Fans watch a Georgia Tech home game during the 1918 college football season. &#13;Photo provided by Georgia Tech alumnus Andy McNeil /Thomas Carter/AP' style='' alt='Fans watch a Georgia Tech home game during the 1918 college football season. <br>Photo provided by Georgia Tech alumnus Andy McNeil /Thomas Carter/AP' class='left' src='/polopoly_fs/1.630646.1590072743!/image/image.jpg_gen/derivatives/box_210/image.jpg' />				
			
		    
						</a>
					</div>
									
																	<div class="small-10 medium-10 large-10 columns">
													<a href="/news/us/old-1918-pandemic-is-a-murky-guide-for-sports-1.630644"><h4>Old 1918 pandemic is a murky guide for sports</h4></a>
							<p class="show-for-large-up">Decades before tailgates, prime-time kickoffs and billions in program-supporting TV money, the ethos of the die-hard college football fan was not much different than today: Risks be damned, we're going to the game. And once fans are allowed back in stadiums, history has shown that football could come back strong.</p>
												</div>
					        </div>
      							</div>
								           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     	            </div>
			</div>
				
	  	
      
  
      				</div>
          	</div>
          	<div class="small-16 columns hide-for-large-up">
          		<hr>
          	</div>

          	          		<div class="small-16 medium-16 large-4 columns">
          	
				<div class="row">
    				
                  
    
  
    
  
    
    
        

		
		
										
		                	
																
			<div class="small-16 columns">
		
				    			
						
            <div class="element list ">
				            	        
	        		        	
	        		            	            			     		            	                 
						
							               			                 
								                   			                   			                   										<ul class="margin-none">
	                   				                   	
		                   			                   			                   			                   	<li><h6>
		                        

        



    
					<a href="/news/us/nfl-studying-helmet-face-guard-that-works-like-surgical-mask-1.630508">
			<h6>NFL studying helmet face guard that works like surgical mask </h6>
		</a>
		
	  		                       								</h6></li>
		             			           			     		            	                 
						
							               			                 
								                   			                   			                   	
		                   			                   			                   			                   	<li><h6>
		                        

        



    
					<a href="/sports/us/nascar-ready-to-fire-up-its-engines-sunday-hoping-to-lead-sports-return-from-quarantine-1.630002">
			<h6>NASCAR ready to fire up its engines Sunday, hoping to lead sports' return from quarantine</h6>
		</a>
		
	  		                       								</h6></li>
		             			           			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     		            			     	 		     	            </div>
			</div>
				
	  	
      
  
      				</div>
			</div>
		</div>
	</div>

										
																						
																														</div>
								</div>
							</div>
						</div>
									</div>
			</div>
		</div>
	</div>
	
 
      
  
                                              </section>
				
											</main>
			
						<aside id="rail" class="large-5 medium-6 small-16 columns">
													
                  
    
  
    
  
    
    
        <!-- DFP Bigboard (Right1) begin -->
<section id="filmstrip" class="panel no-border">
  <script>
    // Convert screen width to em units
    var width = $(window).width() / parseFloat($("html").css("font-size"));
  
    if(width <= 40) {
      document.write('<div class="small-16 small-centered columns" style="padding-left: 0rem;">');
      dfpAd('bigboard');
      document.write('</div>');
    }
    else {
      document.write('<div class="small-16 small-centered columns">');
      dfpAd('bigboard');
      document.write('</div>');
    }
  </script>
</section>
<!-- DFP Leaderboard (Right1) end -->

      
    
    
        		



						<div class="small-16 columns">
				
			<div class='row'>
								
                  
    
  
    
  
    
    
        <div class="small-16 colums" style="margin-bottom:1.5em;">
  <h4 class="rail-header">recent videos</h4>
  <div style="position:relative; padding-bottom:56.25%; overflow:hidden;"><iframe src="https://cdn.jwplayer.com/players/GYr80vet-9WGzrfLj.html" width="100%" height="100%" frameborder="0" scrolling="auto" allowfullscreen style="position:absolute;"></iframe></div>
</div>

      
  
      	
							</div>
		</div>
	 
      
    
    
        

		
		
										
		                	
							<section class="row highlights-list bottom-padding">
				<div class="small-16 columns">
											<h4 class="rail-header">trending</h4>
										<div>
						<div class="small-16 column">
																																																												

        



    
						<div class="row bullet-item">
					<div class="small-16 columns">
				<div class="row">
					<a href="/news/us/family-of-missing-fort-hood-soldier-pleads-for-help-after-one-month-with-no-answers-1.630960">
																					<div class="small-4 columns">
																		

        

    		
        
	        
	            
	        
                    	    
									<img title='Pfc. Vanessa Guillen was last seen at 1 p.m. Wednesday in the parking lot of the Regimental Engineer Squadron Headquarters for 3rd Cavalry Regiment, according to a release from Fort Hood and U.S. Army Criminal Investigation Command.&#13;Fort Hood/ U.S. Army' style='' alt='Pfc. Vanessa Guillen was last seen at 1 p.m. Wednesday in the parking lot of the Regimental Engineer Squadron Headquarters for 3rd Cavalry Regiment, according to a release from Fort Hood and U.S. Army Criminal Investigation Command.<br>Fort Hood/ U.S. Army' class='left' src='/polopoly_fs/1.627614.1588027079!/image/image.png_gen/derivatives/box_160/image.png' />				
			
		    
								</div>
								<div class="small-12 columns">
									<h6>Family of missing Fort Hood soldier pleads for help after one month with no answers</h6>
								</div>
																		</a>
				</div>
			</div>
		</div>
		
	  																																																									

        



    
						<div class="row bullet-item">
					<div class="small-16 columns">
				<div class="row">
					<a href="/news/army/fort-hood-soldier-found-shot-dead-miles-from-his-vehicle-burning-near-texas-base-1.630574">
																					<div class="small-4 columns">
																		

        

    		
        
	        
	            
	        
                    	    
									<img title='Pfc. Brandon Scott Rosecrans&#13;U.S. Army' style='' alt='Pfc. Brandon Scott Rosecrans<br>U.S. Army' class='left' src='/polopoly_fs/1.630576.1590010525!/image/image.jpg_gen/derivatives/box_160/image.jpg' />				
			
		    
								</div>
								<div class="small-12 columns">
									<h6>Fort Hood soldier found shot dead miles from his vehicle burning near Texas base</h6>
								</div>
																		</a>
				</div>
			</div>
		</div>
		
	  																																																									

        



    
						<div class="row bullet-item">
					<div class="small-16 columns">
				<div class="row">
					<a href="/news/marine-corporal-receives-medal-for-saving-injured-motorist-1.630844">
																					<div class="small-4 columns">
																		

        

    		
        
	        
	            
	        
                    	    
									<img title='U.S. Marine Corps Maj. Gen. Robert Castellvi, right, presents the Navy and Marine Corps Commendation Medal to Cpl. Andrew C. Tate at Marine Corps Air Ground Combat Center, Twentynine Palms, Calif., May 4, 2020. Tate was awarded the medal for rescuing a motorist from an overturned car in May 2019.&#13;Conner R. Falb/U.S. Marine Corps' style='' alt='U.S. Marine Corps Maj. Gen. Robert Castellvi, right, presents the Navy and Marine Corps Commendation Medal to Cpl. Andrew C. Tate at Marine Corps Air Ground Combat Center, Twentynine Palms, Calif., May 4, 2020. Tate was awarded the medal for rescuing a motorist from an overturned car in May 2019.<br>Conner R. Falb/U.S. Marine Corps' class='left' src='/polopoly_fs/1.630845.1590146399!/image/image.jpg_gen/derivatives/box_160/image.jpg' />				
			
		    
								</div>
								<div class="small-12 columns">
									<h6>Marine corporal receives medal for saving injured motorist</h6>
								</div>
																		</a>
				</div>
			</div>
		</div>
		
	  																																																									

        



    
						<div class="row bullet-item">
					<div class="small-16 columns">
				<div class="row">
					<a href="/news/navy/navy-trumpets-seven-of-its-11-aircraft-carriers-now-underway-after-beating-back-coronavirus-1.630965">
																					<div class="small-4 columns">
																		

        

    		
        
	        
	            
	        
                    	    
									<img title='The Navy trumpeted on social media Friday, May 22, 2020, that seven of its 11 aircraft carriers are now underway.&#13;U.S. Navy' style='' alt='The Navy trumpeted on social media Friday, May 22, 2020, that seven of its 11 aircraft carriers are now underway.<br>U.S. Navy' class='left' src='/polopoly_fs/1.630966.1590201026!/image/image.jpg_gen/derivatives/box_160/image.jpg' />				
			
		    
								</div>
								<div class="small-12 columns">
									<h6>Navy trumpets seven of its 11 aircraft carriers now underway after beating back coronavirus</h6>
								</div>
																		</a>
				</div>
			</div>
		</div>
		
	  																																																									

        



    
						<div class="row bullet-item">
					<div class="small-16 columns">
				<div class="row">
					<a href="/news/middle-east/guardsman-from-south-carolina-dies-in-afghanistan-1.630629">
																					<div class="small-4 columns">
																		

        

    		
        
	        
	            
	        
                    	    
									<img title='First Lt. Trevarius Ravon Bowman, 25, from Spartanburg, S.C., died at Bagram Airfield on Tuesday, May 19, 2020, the Defense Department said.
&#13;South Carolina National Guard' style='' alt='First Lt. Trevarius Ravon Bowman, 25, from Spartanburg, S.C., died at Bagram Airfield on Tuesday, May 19, 2020, the Defense Department said.
<br>South Carolina National Guard' class='left' src='/polopoly_fs/1.630684.1590080020!/image/image.jpg_gen/derivatives/box_160/image.jpg' />				
			
		    
								</div>
								<div class="small-12 columns">
									<h6>Guardsman from South Carolina dies in Afghanistan</h6>
								</div>
																		</a>
				</div>
			</div>
		</div>
		
	  																																																																																																																																																																																																																																																																																																							</div>
					</div>
				</div>
			</section>
		
						
	  	
      
    
    
        <!-- DFP Bigboard (Right1) begin -->
<section id="filmstrip" class="panel no-border">
  <script>
    // Convert screen width to em units
    var width = $(window).width() / parseFloat($("html").css("font-size"));
  
    if(width <= 40) {
      document.write('<div class="small-16 small-centered columns" style="padding-left: 0rem;">');
      dfpAd('bigboard');
      document.write('</div>');
    }
    else {
      document.write('<div class="small-16 small-centered columns">');
      dfpAd('bigboard');
      document.write('</div>');
    }
  </script>
</section>
<!-- DFP Leaderboard (Right1) end -->

      
    
    
        

		
		
										
		                	
							<section class="row highlights-list bottom-padding">
				<div class="small-16 columns">
											<h4 class="rail-header">stripes rewards</h4>
										<div>
						<div class="small-16 column">
																																																												





								
						<div class="row bullet-item top-highlight">
					<div class="small-16 columns">
				<div class="row">
											<a  href="http://www.stripesstore.com/">
																										



    		
        
	        
	            
	        
                    	    
									<img style='' alt='' class='left' src='/polopoly_fs/1.505415.1582814778!/image/image.jpg_gen/derivatives/600x400/image.jpg' />				
			
		    
														<div class="small-16 columns">
								<h6>Stripes Store</h6>
							</div>
											</a>
				</div>
			</div>
		</div>
		
	    
																																								</div>
					</div>
				</div>
			</section>
		
						
	  	
      
    
    
        <!-- DFP Bigboard (Right1) begin -->
<section id="filmstrip" class="panel no-border">
  <script>
    // Convert screen width to em units
    var width = $(window).width() / parseFloat($("html").css("font-size"));
  
    if(width <= 40) {
      document.write('<div class="small-16 small-centered columns" style="padding-left: 0rem;">');
      dfpAd('bigboard');
      document.write('</div>');
    }
    else {
      document.write('<div class="small-16 small-centered columns">');
      dfpAd('bigboard');
      document.write('</div>');
    }
  </script>
</section>
<!-- DFP Leaderboard (Right1) end -->

      
    
    
        <section id="epaper" class="row">
    <div class="small-16 columns">
        <h4 class="rail-header">today's epaper</h4>
    </div>
    <div class="small-16 columns">
        <div class="panel no-border">
            <div class="small-16 small-centered columns">
              <a href="/epaper"><img alt="Today's ePaper" class="bottom-margin-none" src="//epub.stripes.com/?issue=GSS_GSS_latest&page=medium.jpg"></a>
            </div>
        </div>
    </div>
</section>

      
    
    
        <!-- DFP Bigboard (Right1) begin -->
<section id="filmstrip" class="panel no-border">
  <script>
    // Convert screen width to em units
    var width = $(window).width() / parseFloat($("html").css("font-size"));
  
    if(width <= 40) {
      document.write('<div class="small-16 small-centered columns" style="padding-left: 0rem;">');
      dfpAd('bigboard');
      document.write('</div>');
    }
    else {
      document.write('<div class="small-16 small-centered columns">');
      dfpAd('bigboard');
      document.write('</div>');
    }
  </script>
</section>
<!-- DFP Leaderboard (Right1) end -->

      
    
    
        <section id="social-media" class="row">
  <div class="small-16 columns">
      <div class="row">
          <div class="small-16 columns">
              <h4 class="rail-header">follow us on:</h4>
          </div>
          <div class="small-16 columns">
              <ul class="button-group even-4">
                  <li> 
                      <a href="https://www.facebook.com/stripesmedia/" class="button bttn-facebook" target="_blank"> 
                          <i class="fa fa-facebook fa-2x"></i>
                      </a>
                  </li>
                  <li> 
                      <a href="https://twitter.com/starsandstripes" class="button bttn-twitter" target="_blank"> 
                          <i class="fa fa-twitter fa-2x"></i>
                      </a>
                  </li>
                  <li> 
                      <a href="https://plus.google.com/+starsandstripes" class="button bttn-google" target="_blank">
                          <i class="fa fa-google-plus fa-2x"></i>
                      </a>
                  </li>
                  <li> 
                      <a href="/newsletters" class="button bttn-rss" target="_blank"> 
                          <i class="fa fa-rss fa-2x"></i>
                      </a>
                  </li>
              </ul></div>
          <div class="small-16 columns">
              <div class="panel no-border">
                  <ul id="tweet-links">
                      <lh class="tweet-title"><h4>recent tweets</h4></lh>
                      <a class="twitter-timeline"  href="https://twitter.com/starsandstripes" data-widget-id="664884810033340416" data-chrome="noheader nofooter transparent" data-tweet-limit="3">Tweets by @starsandstripes</a>
                      <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
                  </ul>
              </div>
          </div>
      </div>
  </div>
</section>

      
  
      							</aside>
			
								</div>
		
				<footer>
							
                  
    
  
    
  
    
    
        <!--
This element controls the URLs for author names in article bylines. Each author's name
should link to the content ID for his or her reporter page. An author can have multiple
entries all pointing to the same content ID if they spell their name in multiple ways.

To add a new author, add a new line in the format:
  authors["<author name>"] = "<page content ID>";

For ease of use, please keep authors in alphabetical order by last name.

For help, contact Paul Thomas, Interactive Media team.
-->

<script>
  var authors = {};
  authors["Michael Abrams"] = "2.1270";
  
  authors["Steve Beynon"] = "2.2551";
  authors["James Bolinger"] = "2.2492";
  authors["Carlos Bongioanni"] = "2.1835";
  authors["Brian Bowers"] = "2.1350";
  authors["Gregory Broome"] = "2.1905";
  authors['Matt Burke'] = "2.1728";
  authors["Matthew M. Burke"] = "2.1728";
   
  authors["Mike Darnell"] = "2.1958";
  authors["Michael S. Darnell"] = "2.1958";
  authors["Michael Darnell"] = "2.1958";
  authors["Christopher Dennis"] = "2.2535";
  authors["Corey Dickstein"] = "2.2149";
  authors["Caitlin Doornbos"] = "2.2491";
  
  authors["Martin Egnash"] = "2.2391";
  
  authors["Brian Ferguson"] = "2.2511";
  authors["Neil Fotre"] = "2.2549";

  authors["Kim Gamel"] = "2.2246";
  authors["Chad Garland"] = "2.2248";
  authors["Joe Gromelski"] = "2.2243";
  
  authors["Ken-Yon Hardy"] = "2.2383";
  authors["Kent Harris"] = "2.1274";
  
  authors["Aya Ichihashi"] = "2.2532";
  
  authors["Joshua Karsten"] = "2.2509";
  authors["Matthew Keeler"] = "2.2522";
  authors["Caitlin M. Kenney"] = "2.2507";
  authors["Caitlin Kenney"] = "2.2507";
  authors["Aaron Kidd"] = "2.2131";

  authors["Marcus Kloeckner"] = "2.1279";
  authors["Aaron Knowles"] = "2.2508";
  authors["Hana Kusumoto"] = "2.1281";

  authors["Norman Llamas"] = "2.2537";
  authors["J.P. Lawrence"] = "2.2493";
  authors["J.p. Lawrence"] = "2.2493";
  authors["Christian Lopez"] = "2.2510";
  
  authors["Will Morris"] = "2.2494";
  authors["Nancy Montgomery"] = "2.1267";

  authors["Wyatt Olson"] = "2.1926";
  authors["Dave Ornauer"] = "2.1297";

  authors["Seth Robson"] = "2.1266";
  
  authors["Erik Slavin"] = "2.1285";
  authors["Jennifer H. Svan"] = "2.1269";
  authors["Jennifer Svan"] = "2.1269";

  authors["Rose L. Thayer"] = "2.2502";
  authors["Meredith Tibbetts"] = "2.1931";

  authors["John Vandiver"] = "2.1272";
  authors["Carlos Vazquez"] = "2.2531";
  authors["Carlos M. Vazquez II"] = "2.2531";
  
  authors["Phillip Walter Wellman"] = "2.2247";
  authors["Nikki Wentling"] = "2.2357";
  authors["Scott Wyland"] = "2.2478";
  
  $(".article_credits p").each(function() {
    var thisByline = this;
    jQuery.each(authors, function(key, value) {
      upperKey = key.toUpperCase();
      authorName = key.replace(' ', '_');
      authorLink = $(thisByline).html().replace(upperKey, "<a href='/reporters/" + value + "?author=" + authorName + "'>" + upperKey + "</a>");
      $(thisByline).html(authorLink);
    });
  });
</script>

      
    
    
        <script type="text/javascript">
window._ttf = window._ttf || [];
_ttf.push({
       pid          : 48484
       ,lang        : "en"
       ,slot        : '#article-text > p'
       ,format      : "inread"
       ,minSlot     : 4
       ,components  : { skip: {delay : 0}}
       ,css         : "margin: 0px 0px 25px;"
});

(function (d) {
        var js, s = d.getElementsByTagName('script')[0];
        js = d.createElement('script');
        js.async = true;
        js.src = '//cdn.teads.tv/media/format.js';
        s.parentNode.insertBefore(js, s);
})(window.document);
</script>

      
    
    
        <script>
if (navigator.userAgent.match(/StripesApp/i)) {
  (function(jQuery) {
    jQuery('#filmstrip:first').hide();
    })( jQuery );
 }
</script>

      
    
    
        <div id="footer-bar-1">
  <div class="row"> 
      <div class="medium-12 large-10 columns hide-for-small-only">
          <ul class="inline-list">
              <li class="snscontainer show-for-large-up">
                  <ul>
                      <li><a class="sns-fb" href="https://www.facebook.com/stripesmedia/" target="_blank"><i class="fa fa-facebook fa-fw"></i></a></li>
                      <li><a class="sns-tw" href="https://twitter.com/starsandstripes" target="_blank"><i class="fa fa-twitter fa-fw"></i></a></li>
                      <li><a class="sns-g" href="https://plus.google.com/+starsandstripes" target="_blank"><i class="fa fa-google-plus fa-fw"></i></a></li>
                      <li><a class="sns-rs" href="/newsletters" target="_blank"><i class="fa fa-rss fa-fw"></i></a></li>
                  </ul>
              </li>
              <li><a href="/rewards">Rewards</a></li>
              <li class="divider"></li>
              <li><a href="http://www.stripesstore.com/">Store</a></li>
              <li class="divider"></li>
              <li><a href="https://classifieds.stripes.com/">Classifieds</a></li>
              <li class="divider"></li>
              <li><a href="/subscribe/2.2422/">Newsletters</a></li>
              <li class="divider"></li>
              <li><a href="/epaper">ePaper</a></li>
              <li class="divider"></li>
              <li><a href="https://www.stripes.com/apps/">Mobile Apps</a></li>
          </ul>
      </div>
      <div class="small-8 large-3 columns hide-for-medium-only">
          <ul class="inline-list">
              <li>SUBSCRIBE: </li>
              <li><a href="/subscribe/2.2398/">Digital</a></li>
              <li class="divider"></li>
              <li><a href="/subscribe/2.2397/">Print</a></li>
          </ul>
      </div>
      <div class="small-8 medium-4 large-3 columns">
          <ul class="inline-list right">
              <li>
                <a class="stripes-login-button" style="cursor: pointer"><i class="fa fa-user fa-fw"></i>Login</a>
              </li>
          </ul>
      </div>
  </div>
</div>
<div id="footer-bar-2">
    <div class="row">
        <div class="small-13 column">
            <ul class="inline-list">
              <li class="hide-for-medium-only"><a href="/">&copy; 2020 Stars and Stripes. All Rights Reserved.</a></li>
                <li class="divider show-for-large-up"></li>
              <li class="hide-for-small-only"><a href="/1.103221/">Disclaimer</a></li>
                <li class="divider hide-for-small-only"></li>
              <!--li class="hide-for-small-only"><a href="/1.125608/">Comment Policy</a></li-->
              <li class="hide-for-small-only"><a href="/opinion/ombudsman">Ombudsman</a></li>
                <li class="divider hide-for-small-only"></li>
              <li class="hide-for-small-only"><a href="/2.1326/">Web Notices and Privacy Policy</a></li>
                <li class="divider hide-for-small-only"></li>
                <li class="hide-for-small-only"><a href="//dodcio.defense.gov/DoDSection508/Std_Stmt.aspx">Accessibility &frasl; Section 508</a></li>
            </ul>
        </div>
        <div class="small-3 column">
            <ul class="inline-list right">
                <li class="show-for-large-up"><a href="/site-map">Site Map</a></li>
                <li class="divider show-for-large-up"></li>
                <li><a class="link_to_top" href="#">Top <i class="fa fa-angle-up fa-lg"></i></a></li>
            </ul>
        </div>
    </div>
</div>

      
    
    
        <!-- <script>
var Pelcro = window.Pelcro || (window.Pelcro = {}); 
Pelcro.siteid = "905";
Pelcro.environment = {};
Pelcro.environment.ui = "https://www.pelcro.com/js/bab/ui-v120.min.js";
</script>
<script async src="//cdn.pelcro.com/js/bab/min.js" type="text/javascript"></script> -->

<script>var Pelcro = window.Pelcro || (window.Pelcro = {}); Pelcro.siteid = "905";</script>
<script async src="//js.pelcro.com/sdk/main.min.js" type="text/javascript"></script>


<style>
#pelcro-app .pelcro-prefix-view .pelcro-prefix-btn {
  background-color: #014c9f !important; 
  border-color: #014c9f !important;
  border-radius: 0px !important;
}

#pelcro-app .pelcro-prefix-view .pelcro-prefix-btn:hover {
  background-color: #014c9f !important; 
  border-color: #014c9f !important;
  border-radius: 0px !important;
}

#pelcro-app .pelcro-prefix-view h1, #pelcro-app .pelcro-prefix-view h2, 
#pelcro-app .pelcro-prefix-view h3, #pelcro-app .pelcro-prefix-view h4, 
#pelcro-app .pelcro-prefix-view p,#pelcro-app .pelcro-prefix-view div{
  font-family: Georgia,Times,"Times New Roman",serif !important;
}

#pelcro-app .pelcro-prefix-view .pelcro-prefix-link {
  color: #014c9f !important;
}

#pelcro-app .pelcro-prefix-view .pelcro-prefix-site-name {
  display: none !important;
}
  
#pelcro-app .pelcro-prefix-link {
  background-color: white !important;
}
  
#pelcro-app #list .pelcro-prefix-product-button {
  min-width: 28%;   
}
  
#pelcro-app #list .pelcro-prefix-product-container,
#pelcro-app #list .pelcro-prefix-plan-container {
  margin-left: 0px !important;
  margin-right: 0px !important;
}
  
#pelcro-view-menu {
  display: none;
}
</style>

      
  
      					</footer>
	</div> <!-- inner-wrap -->
	</div> <!-- off-canvas-wrap -->
	
	<script>
		$(document).foundation();
		$(document).foundation('topbar', {scrolltop: false});
		$('.menuItem').click(function (evt) {
			$('.toggle-topbar').click();
		});
	</script>
	
	</body>
	
				    </html>
