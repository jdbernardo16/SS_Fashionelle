<section class="pdtl_frame1">
	<div class="frm-cntnr width--90">
		<div class="pdtl_frame1-crums">
			<div class="vertical-parent">
				<div class="vertical-align inlineBlock-parent">
					<a href="product">Products &gt; </a>
					<p> $Title</p>
				</div>
			</div>
		</div>
		<div class="product-cntnr">
			<div class="inlineBlock-parent">
				<div class="product-images-cntnr">
					<div class="inlineBlock-parent">
						<div class="product-images-choices">
							<% loop $ProductPhotos %>
							<div class="prdct-img-hldr">
								<a href="" value="#img$ID">
								<div class="product-images-item" style="background-image: url('$Image.URL');"></div>
								</a>
							</div>
							<% end_loop %>
						</div
						><div class="product-image-holder">
							<div class="product-image-cntnr fadeIn">
								<% loop $ProductPhotos %>
								<div id="img$ID" class="product-image" style="background-image: url('$Image.URL');"></div>
								<% end_loop %>
							</div>
							<div class="m-image-menu">
								<div class="m-image-hldr">
									<% loop $ProductPhotos %>
									<div class="m-img-cntnr prdct-img-hldr">
										<a href="" value="#img$ID">
										<div class="m-img" style="background-image: url('$Image.URL');"></div>
										</a>
									</div>
									<% end_loop %>
								</div>
							</div>
							<div class="share-feature">
								<div class="vertical-parent">
									<div class="vertical-align">
										<div class="share-hldr inlineBlock-parent">
											<div class="share-text">
												<p>Share to:</p>
											</div
											><div class="sharethis-inline-share-buttons"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div
				><div class="product-details align-t">
					<div class="product-title-cntnr inlineBlock-parent">
						<div class="product-title">
							<h3>$Name</h3>
						</div>
					</div>
					<div class="product-desc-title">
						<p>Description:</p>
					</div>
					<div class="product-desc">
						$Desc
					</div>
					<div class="price-hldr">
						<p class="title">Price:</p>
						<p>$Price</p>
					</div>
					<% if $SLink %>
					<div class="shopee-btn" style="margin-bottom: 30px;">
						<a href="$SLink" target="_blank">
							<div class="btn">
								<p>View on Shopee</p>
							</div>
						</a>
					</div>
					<% end_if %>

					<div class="shopee-btn">
						<a href="product">
							<div class="btn">
								<p>Go Back</p>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>