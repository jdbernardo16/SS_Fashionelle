<div id="header">
	<div class="header-wrapper">
		<div class="inlineBlock-parent">
			<div class="left-side inlineBlock-parent">
				<div class="social-wrapper">
					<% loop $HeaderFooter %>
					<div class="inlineBlock-parent">
						<a href="$fblink" target="_blank" class="social-img">
							<img src="$ThemeDir/images/fb.svg" alt="">	
						</a
						><a href="$iglink" target="_blank" class="social-img">
							<img src="$ThemeDir/images/ig.svg" alt="">	
						</a>
					</div>
					<% end_loop %>
				</div
				><% loop $menu(1).limit(2) %><div class="menu-text $LinkingMode">
					<a href="$Link">$Title</a>
				</div
				><% end_loop %>
			</div
			><div class="logo-hldr">
				<a href="$AbsoluteBaseURL" class="menu-logo">
				<% loop $HeaderFooter %>
					<img src="$Logo.URL" alt="">
				<% end_loop %>
				</a>
			</div
			><div class="right-side inlineBlock-parent">
				<% loop $menu(1).limit(4, 2) %><div class="menu-text $LinkingMode">
					<a href="$Link">$Title</a>
				</div
				><% end_loop %>
			</div>
		</div>
	</div>
	<div class="mobile-menu">
		<div class="m-menu">
			<div class="vertical-parent">
				<div class="vertical-align">
					<div id="nav-icon1">
					  <span></span>
					  <span></span>
					  <span></span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div
><div class="m-menu-hldr">
	<ul>
		<% loop $Menu(1) %>
		<li class="$LinkingMode">
			<a href="$Link">$Title</a> 
		</li>
		<% end_loop %>
	</ul>
</div
>