<section class="prdct-banner">
	<div class="banner" style="background-image: url('$F1BG.URL')">
		<div class="gradient">
			<div class="wrapper">
				<div class="vertical-parent">
					<div class="vertical-align">
						<div class="product-header fadeIn">
							<h1>$F1Title</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="prdct_frame1">
	<div id="tabs" class="wrapper">
		<div class="inlineBlock-parent">
			<div class="prdct_menu align-t">
				<div class="side_menu-hldr">
					
					<div class="side_menu">
						<div class="menu-title">
							<p>Product Menu</p>
						</div>
						<% loop $Menu(2) %>
							<div class="side_menu-item" @click="activetab = $ID" v-bind:class="{'active':activetab == $ID }">
								<a>$Title</a>
							</div>
						<% end_loop %>
					</div>
				</div>
			</div
			><div class="product_list-cntnr alignt fadeIn">
				<% loop $Menu(2) %>
					<transition name="slide-fade">
					<div v-if="activetab == $ID" class="inlineBlock-parent">
						<% loop $Children %><div class="product_hldr">
							<div class="product">
								<% loop $ProductPhotos.limit(1) %>
								<div class="product-image" style="background-image: url('$Image.URL')"></div>
								<% end_loop %>
								<div class="product-name">
									<p>$Name</p>
								</div>
								<div class="product-price">
									<p>Php 60.00</p>
								</div>
								<div class="product-btn">
									<a href="$Link">
										<div class="btn">
											<p>View</p>
										</div>
									</a>
								</div>
							</div>
						</div
						><% end_loop %>
					</div>
					</transition>
				<% end_loop %>
			</div>
		</div>
	</div>
</section>

