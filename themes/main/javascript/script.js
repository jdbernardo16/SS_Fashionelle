  
$(document).ready(function() {
	app.init();
});

var app = {
	init: function() {
		var setup = this.setup;

		switch(pageID) {
			case 'HomePage':
				setup.homepage();
				break;
			case 'AboutPage':
				setup.aboutpage();
				break;
			case 'ProductPage':
				setup.productpage();
				break;
			case 'Product':
				setup.product();
				break;
			case 'ContactPage':
				setup.contactpage();
				break;
		}

		setup.menu();
	},


	setup: {

		menu: function() {
			$(window).on("scroll", function() {
			    if($(window).scrollTop() > 100 ) {
			          $('#header').addClass('scroll');
			    }
			    else {
			          $('#header').removeClass('scroll');
			    }
			});

			/**
			* Header
			*/


			// $(document).ready(function() {
			// 	setTimeout(function(){
			// 		$('.loader').fadeOut();
			// 	}, 3000);
			// }); 

			$(document).ready(function(){
				$('#nav-icon1').click(function(){
					$(this).toggleClass('open');
					$('.m-menu-hldr').toggleClass('open');
				});
			});

		},

		homepage: function() {


			$('.comments-hldr').slick({
				infinite: true,
				slidesToShow: 1,
				slidesToScroll: 1,
				autoplay: true,
  				autoplaySpeed: 3000,
  				speed: 1000,
  				arrow: true
			});

			$('.product-cntnr .featured-slick').slick({
				dots: true,
				infinite: false,
				speed: 300,
				mobileFirst: true,
				slidesToShow: 1,
				slidesToScroll: 1,
				responsive: [
					{
						breakpoint: 1025,
						settings: 'unslick'
					}
				]
			});


			$('.image-hldr .ig-slick').slick({
				dots: true,
				infinite: false,
				speed: 300,
				mobileFirst: true,
				slidesToShow: 1,
				slidesToScroll: 1,
				responsive: [
					{
						breakpoint: 1025,
						settings: 'unslick'
					}
				]
			});

			
		},

		aboutpage: function() {

			$('.abt_slider').slick({
				infinite: true,
				slidesToShow: 5,
				slidesToScroll: 1,
				autoplay: true,
  				autoplaySpeed: 5000,
  				responsive: [
					{
						breakpoint: 1024,
						settings: {
							slidesToShow: 1,
							slidesToScroll: 1,
						}
					}
				]
			});

		},

		productpage: function() {
			new Vue({
			    el: '#tabs',
			    data: { activetab: 15 },
			});

			
		},

		product: function() {
			$('.prdct-img-hldr:first').addClass('prdct-active');
			$('.product-image').hide();
			$('.product-image:first').show();
			$('.prdct-img-hldr').on('click',function(){
				$('.prdct-img-hldr').removeClass('prdct-active');
				$(this).addClass('prdct-active')
				$('.product-image').hide();
			    var product = $(this).find('a').attr('value');
			    $(product).fadeIn();
			    return false;
			});

			$('.m-image-hldr').slick({
				infinite: true,
				slidesToShow: 3,
				slidesToScroll: 1,
				autoplay: true,
  				autoplaySpeed: 5000
			});
		},
		contactpage: function() {
			app.form.init($('#contactForm'), $('#contactBtn'), 'form/contact/send', false);
		}
	},

	form: {
		/**
		* SENDING FORM
		* - Identify the form name, button name, the url (controller route), and if you want to 'refresh' the page.	
		**/
		init: function(formName, btnName, routeVal, boolean) {
			var form = formName,
				btn = btnName,
				route = routeVal,
				bool = boolean;

			form.validate({
				submitHandler: function(form) {
					swal({
						title: 'Sending ...',
						text: '',
						timer: 2000,
						onOpen: function () {
							swal.showLoading()
						}
					})
					var vars = $(form).serialize();
					$.post(baseHref + route, vars, function(data) {
						switch(data.status) {
							case 0:
								setMessage(false,data.message);
							break;
							case 1: 
								setMessage(true,data.message);
								$(form).trigger('reset');
								if(bool == true) {
									
									window.location.reload(1);
									
								}

							break;
						}

					}, 'json');
				}
			});

			$(btn).on('click', function(e) {
				e.preventDefault();
				form.submit();

				//label error -- for mobile
				if($(window).width() < 900) {
					$('label.error').empty();
					$('label.error').text("*");
				}
			});

			function setMessage(status, msg) {
				if(status) {
					swal('',msg,'success')
				} else {
					swal('',msg,'error')
				}
			}
		},

		/**
		* SENDING FORM W/ ATTACHMENTS
		* - Bind the uploaded file first, before sending.
		* - Identify where the file should be uploaded, button name, and the url (controller route).	
		* - Requirements: 
					Javascript:
						  jquery.fileupload.js
						  jquery.iframe-transport.js
						  jquery.ui.widget.js
					Composer:
						  "gargron/fileupload": "~1.4.0"
					Silverstripe:
						   Controller: Create UploadController
						   ModelAdmin: Create an admin manager for back up purposes (list of emails received)
						   Assets: Create folder inside, depends on what you declared
						   Template Syntax: 
						   		<label id="file-selected-permit" for="fileupload-permit" class="custom-file-upload">Business/Mayor Permit <i class="ion-paperclip"></i></label>
								<input type="file" id="fileupload-permit" name="file" style="display: none;">
								<input type="hidden" id="file-image-permit" name="permit" value="">

		**/
		bindUploadField: function(fileUpload, fileImg, fileSelected, formBtn, url) {
			var $file_upload = fileUpload,
				$file_img = fileImg,
				$file_selected = fileSelected,
				$form_btn = formBtn,
				$url = url;

			$file_upload.fileupload({
		        url: baseHref + $url,
		        dataType: 'json',
				submit: function(e, data) {},
				done: function(e, data) {
					switch(data.result.status) {
						case 0: break;
						case 1: 
							
							$file_img.val(data.result.message);
							$file_selected.html(data.result.filename);
							$form_btn.fadeIn(); 

						break;
					}
				}
		    });
		}
	}
}