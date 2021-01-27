<section class="hm_frame1">
	<div class="wrapper">
		<div class="inlineBlock-parent">
			<div class="image-left fadeIn">
				<div class="image" style="background-image: url('$F1IMG.URL')"></div>
			</div
			><div class="cntnr-right staggerup_hldr">
				<div class="vertical-parent">
					<div class="vertical-align">
						<div class="cntnr-wrapper">
							<div class="hm_frame1-header staggerup">
								<h1>$F1Title</h1>
							</div>
							<div class="hm_frame1-text staggerup">
								<p>$F1Desc</p>
							</div>
							<div class="button-hldr staggerup">
								<a href="$F1Link">
									<div class="btn">
										<p>About</p>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="hm_frame2">
	<div class="wrapper">
		<div class="hm_frame2-header animate-up">
			<h1>$F2Header</h1>
		</div>

		<div class="product-cntnr staggerup_hldr2">
			<div class="featured-slick">
				<% loop $FeaturedProducts %>
				<div class="product-hldr staggerup2">
					<% loop $ProductPhotos.limit(1) %>
					<div class="product-img" style="background-image: url('$Image.URL')"></div>
					<% end_loop %>
					<div class="product-desc">
						<p>$Name</p>
					</div>
					<div class="product-price">
						<p>$Price</p>
					</div>
					<div class="product-btn">
						<a href="$Link" target="_blank">
							<div class="btn">
								<p>View Product</p>
							</div>
						</a>
					</div>
				</div>
				<% end_loop %>
			</div>
		</div>
	</div>
</section>

<section class="hm_frame3">
	<div class="hm_frame3-bg">
		<div class="bg-item fadeIn" style="background-image: url('$F3BG.URL')"></div>
	</div>
	<div class="frm-cntnr">
		<div class="wrapper">
			<div class="inlineBlock-parent">
				<div class="left-cntnr">
					<div class="card staggerup_hldr3">
						<div class="card-wrapper">
							<div class="card-header staggerup3">
								<h1>$F3Title</h1>
							</div>
							<div class="card-text staggerup3">
								<p>$F3Desc</p>
							</div>
							<div class="card-btn staggerup3">
								<a href="$F3Link">
									<div class="btn">
										<p>LET'S CHAT</p>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div
				><div class="right-cntnr">
					<div class="image-cntnr animate-right">
						<div class="image" style="background-image: url('$F3IMG.URL')"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>



<section class="hm_frame4">
	<div class="wrapper staggerup_hldr4">
		<div class="hm_frame4-header staggerup4">
				<h1>$F4Header</h1>
		</div>
			<div class="comments-hldr staggerup4">
				<% loop $Quotes %>
				<div class="comments">
					<p>$Quote</p>
				</div>
				<% end_loop %>
			</div>
		</div>
</section>

<section class="hm_frame5">
	<div class="hm_frame5-bg"></div>
	<div class="wrapper">
		<div class="hm_frame5-header fadeIn">
			<h1>$F5Header</h1>
		</div>
		<div class="image-hldr">
			<div class="ig-slick staggerup_hldr5">
				<% loop $IGPhotos %><a class="staggerup5" href="$IGLink" target="_blank">
					<div class="image" style="background-image: url('$Image.URL');"></div>
				</a
				><% end_loop %>
			</div>
		</div>
	</div>
</section>


