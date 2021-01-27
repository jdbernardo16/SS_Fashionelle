<section class="abt_frame1">
	<div class="abt_frame1-bg fadeIn" style="background-image: url('$F1BG.URL')">
		<div class="overlay"></div>
	</div>
	<div class="wrapper staggerup_hldr">
		<div class="vertical-parent">
			<div class="vertical-align">
				<div class="text-hldr">
					<div class="abt_frame1-hdr staggerup">
						<h1>$F1Title</h1>
					</div>
					<div class="abt_frame1-text staggerup">
						<p>$F1Desc</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="abt_frame2">
	<div class="wrapper">
		<div class="abt_frame2-hdr fadeIn">
			<h1>$F2Header</h1>
		</div>
		<div class="abt_slider staggerup_hldr1">
			<% loop $Itemtypes %>
			<div class="abt_slider-item staggerup1">
				<div class="item-hldr">
					<img src="$Image.URL" alt="">
					<div class="item-desc">
						<p>$Item</p>
					</div>
				</div>
			</div>
			<% end_loop %>
		</div>
	</div>
</section>

<section class="abt_frame3">
	<div class="wrapper">
		<div class="inlineBlock-parent">
			<div class="shopee-img">
				<div class="image-hldr animate-left" style="background-image: url('$F3IMG.URL');"></div>
			</div
			><div class="abt_frame3-content staggerup_hldr2">
				<div class="abt_frame3-hdr staggerup2">
					<h1>$F3Title</h1>
				</div>
				<div class="abt_frame3-desc staggerup2">
					<p>$F3Desc</p>
				</div>
				<div class="btn-hldr staggerup2">
					<a href="$F3Link" target="_blank">
						<div class="btn">
							<p>Visit</p>
						</div>
					</a>
				</div>
				
			</div>
		</div>
	</div>
</section>
