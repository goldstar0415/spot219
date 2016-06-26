+function($, window){ 'use strict';
	var app = {
		name: 'Infinity',
		version: '1.0.0'
	};

	app.defaults = {
		sidebar: {
			folded: false,
			theme: 'light',
			themes: ['light', 'dark']
		},
		navbar: {
			theme: 'primary',
			themes: ['primary', 'success', 'warning', 'danger', 'pink', 'purple', 'inverse', 'dark']
		}
	};

	app.$body = $('body');
	app.$sidebar = $('#app-aside');
	app.$navbar = $('#app-navbar');
	app.$main = $('#app-main');

	app.settings = app.defaults;

	var appSettings = app.name+"Settings";
	app.storage = $.localStorage;

	if (app.storage.isEmpty(appSettings)) {
		app.storage.set(appSettings, app.settings);
	} else {
		app.settings = app.storage.get(appSettings);
	}

	app.saveSettings = function() {
		app.storage.set(appSettings, app.settings);
	};

	// initialize navbar
	app.$navbar.removeClass('primary').addClass(app.settings.navbar.theme).addClass('in');
	app.$body.removeClass('theme-primary').addClass('theme-'+app.settings.navbar.theme);

	// initialize sidebar
	app.$sidebar.removeClass('light').addClass(app.settings.sidebar.theme).addClass('in');
	app.settings.sidebar.folded
		&& app.$sidebar.addClass('folded')
		&& app.$body.addClass('sb-folded')
		&& $('#aside-fold').removeClass('is-active');

	// initialize main
	app.$main.addClass('in');
	
	app.init = function() {

		$('[data-plugin]').plugins();
		$('.scrollable-container').perfectScrollbar();
		$('.sf-menu').superfish();

		// load some needed libs listed at: LIBS.others => library.js
		var loadingLibs = loader.load(LIBS["others"]);
		
		loadingLibs.done(function(){

			$('[data-switchery]').each(function(){
				var $this = $(this),
						color = $this.attr('data-color') || '#188ae2',
						jackColor = $this.attr('data-jackColor') || '#ffffff',
						size = $this.attr('data-size') || 'default'

				new Switchery(this, {
					color: color,
					size: size,
					jackColor: jackColor
				});
			});
		});
	};

	window.app = app;
}(jQuery, window);


// NAVBAR MODULE
// =====================
+function($, window){ 'use strict';
	
	// Cache DOM
	var $body = app.$body,
			$navbar = app.$navbar;

	var navbar = {};

	navbar.init = function() {
		this.listenForEvents();
	};

	navbar.listenForEvents = function() {
		$(document)
			.on('click', '#navbar-search-open', openSearch)
			.on('click', '#search-close, .search-backdrop', closeSearch);
	};

	navbar.getAppliedTheme = function() {
		var appliedTheme = "", themes = app.settings.navbar.themes, theme;
		for(theme in themes) {
			if ($navbar.hasClass(themes[theme])) {
				appliedTheme = themes[theme];
				break;
			}
		}
		return appliedTheme;
	};

	navbar.getCurrentTheme = function() {
		return app.settings.navbar.theme;
	};

	navbar.setTheme = function(theme) {
		if (theme) app.settings.navbar.theme = theme;
	};

	navbar.applyTheme = function() {
		var appliedTheme = this.getAppliedTheme();
		var currentTheme = this.getCurrentTheme();

		$navbar.removeClass(appliedTheme)
			.addClass(currentTheme);

		$body.removeClass('theme-'+appliedTheme)
			.addClass('theme-'+currentTheme);
	};


	function openSearch(e) {
		e.preventDefault();
		e.stopPropagation();
		$navbar.append('<div class="search-backdrop"></div>');
		$('#navbar-search').addClass('open');
		$('.search-backdrop').addClass('open');
	}

	function closeSearch(e) {
		e.preventDefault();
		e.stopPropagation();
		$('#navbar-search').removeClass('open');
		$('.search-backdrop').removeClass('open').remove();
	}

	window.app.navbar = navbar;
}(jQuery, window);


// SIDEBAR MODULE
// =====================
+function($, window){ 'use strict';
	// Cache DOM
	var $body = app.$body,
			$sidebar = app.$sidebar,
			$sidebarFold = $('#aside-fold'),
			$sidebarToggle = $('#aside-toggle');
		
	var sidebar = {};

	sidebar.init = function() {
		this.listenForEvents();
	};

	sidebar.listenForEvents = function() {
		var self = this;

		self.initScroll();
		self.toggleScroll();

		$body.on('mouseenter mouseleave', '.folded:not(.open) .has-submenu', function(e){
			$(this).find('.submenu').toggle().end().siblings().find('.submenu').hide();
		});

		$body.on('click', '.submenu-toggle', function(e){
			e.preventDefault();
			$(this).parent().toggleClass('open').find('.submenu').slideToggle(500).end().siblings().removeClass('open').find('.submenu').slideUp(500);
		});
		
		$sidebarFold.on('click', function(e){
			e.preventDefault();
			self.fold();
			self.toggleScroll();
		});

		$sidebarToggle.on('click', self.open);

		$body.on('click', '.aside-backdrop', self.close);

		$(window).on('load', function(e){
			var ww = $(window).width();
			if(ww < 992 && app.$sidebar.hasClass('folded')) {
				app.$sidebar.removeClass('folded');
				app.$body.removeClass('sb-folded');
				sidebar.toggleScroll();
			} else if(ww >= 992 && app.settings.sidebar.folded){
				app.$sidebar.addClass('folded');
				app.$body.addClass('sb-folded');
				sidebar.toggleScroll();
			}
		});
	};

	sidebar.getAppliedTheme = function() {
		var appliedTheme = "", themes = app.settings.sidebar.themes, theme;
		for(theme in themes) {
			if ($sidebar.hasClass(themes[theme])) {
				appliedTheme = themes[theme];
				break;
			}
		}
		return appliedTheme;
	};

	sidebar.getCurrentTheme = function() {
		return app.settings.sidebar.theme;
	};

	sidebar.setTheme = function(theme) {
		if (theme) app.settings.sidebar.theme = theme;
	};

	sidebar.applyTheme = function() {
		$sidebar.removeClass(this.getAppliedTheme())
			.addClass(this.getCurrentTheme());
	};

	sidebar.fold = function() {
		$sidebarFold.toggleClass('is-active');
		$sidebar.toggleClass('folded');
		$body.toggleClass('sb-folded');
	};

	sidebar.open = function(e) {
		e.preventDefault();
		$sidebar.after('<div class="aside-backdrop"></div>');
		$sidebar.addClass('open');
		$sidebarToggle.addClass('is-active');
		$body.addClass('sb-open');
	};
	
	sidebar.close = function(e) {
		e.preventDefault();
		$sidebar.removeClass('open');

		$sidebarToggle.removeClass('is-active');
		$body
			.removeClass('sb-open')
			.find('.aside-backdrop')
				.remove();
	};

	sidebar.initScroll = function() {
		$('#aside-scroll-inner').slimScroll({
			height: 'auto',
			position: 'right',
			size: "5px",
			color: '#98a6ad',
			wheelStep: 5
		});
	};

	sidebar.toggleScroll = function(){
		var $scrollContainer = $('#aside-scroll-inner');
		if($body.hasClass("sb-folded")){
			$scrollContainer.css("overflow","inherit").parent().css("overflow","inherit");
			$scrollContainer.siblings(".slimScrollBar").css("visibility","hidden");
		} else{
			$scrollContainer.css("overflow","hidden").parent().css("overflow","hidden");
			$scrollContainer.siblings(".slimScrollBar").css("visibility","visible");
		}
	};

	window.app.sidebar = sidebar;
}(jQuery, window);


// CUSTOMIZER MODULE
// =====================

+function($, window){ 'use strict';
	
	// Cache DOM
	var $body = app.$body,
			$sidebar = app.$sidebar,
			$navbar = app.$navbar;

	var customizer = {};

	customizer.init = function() {
		this.listenForEvents();
	}

	customizer.listenForEvents = function() {
		var self = this;

		// initialize customizer component
		self.initCustomizer();

		$('[name="aside-theme"]').on('change', function(e){
			var $this = $(this);
			if (app.sidebar.getCurrentTheme() !== $this.attr('data-theme')) {
				app.sidebar.setTheme($this.attr('data-theme'));
				app.sidebar.applyTheme();
				app.saveSettings();
			}
		});

		$('#aside-fold-switch').on('change', function(e){
			if ($(this).is(':checked')) {
				app.settings.sidebar.folded = true;
				$sidebar.addClass('folded');
				$body.addClass('sb-folded');
				$('#aside-fold').removeClass('is-active');
			} else {
				app.settings.sidebar.folded = false;
				$sidebar.removeClass('folded');
				$body.removeClass('sb-folded');
				$('#aside-fold').addClass('is-active');
			}
			app.sidebar.toggleScroll();
			app.saveSettings();
		});

		// Resets sidebar settings to defaults
		$('#aside-reset-btn').on('click', function(e){
			app.settings.sidebar = app.defaults.sidebar;
			app.saveSettings();
			location.reload();
		});

		// navbar theme change
		$('[name="navbar-theme"]').on('change', function(e){
			var $this = $(this);
			if (app.navbar.getCurrentTheme() !== $this.attr('data-theme')) {
				app.navbar.setTheme($this.attr('data-theme'));
				app.navbar.applyTheme();
				app.saveSettings();
			}
		});

		// Resets navbar settings to defaults
		$('#navbar-reset-btn').on('click', function(e){
			app.settings.navbar = app.defaults.navbar;
			app.saveSettings();
			location.reload();
		});
	};

	customizer.initCustomizer = function() {
		$('[data-theme="'+app.sidebar.getCurrentTheme()+'"]').prop('checked', true);
		$('[data-theme="'+app.navbar.getCurrentTheme()+'"]').prop('checked', true);
		app.settings.sidebar.folded && $('#aside-fold-switch').prop('checked', true);
	};

	window.app.customizer = customizer;
}(jQuery, window);


// initialize app
+function($, window) { 'use strict';
	window.app.init();
	window.app.navbar.init();
	window.app.sidebar.init();
	window.app.customizer.init();
}(jQuery, window);