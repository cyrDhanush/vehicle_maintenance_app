// allow for this file to be included multiple times by checking for the existence of these vars
window.invisionUtils = window.invisionUtils || {
	isDev: false,
	loaded: false,
	initialized: false,
	scripts: {
		functional: [],
		advertising: []
	},
	consent: {
		functional: false,
		advertising: false
	}
};

window.invisionUtils.addInvisionScript = window.invisionUtils.addInvisionScript || function(script,category) {
	if ( !category ) {
		category = "functional";
	}
	window.invisionUtils.scripts[category].push(script);
	
	// if the scripts have already been loaded, then we need to process this script immediately
	if ( window.invisionUtils.loaded ) {
		window.invisionUtils.loadScripts(category);
	}
};

window.invisionUtils.loadScripts = window.invisionUtils.loadScripts || function(category,override) {
	if ( !category ) {
		category = "all";
	}

	const consent = {
		functional: override ? true : StorageConsent.canRunFunctionalScripts(),
		advertising: override ? true : StorageConsent.canRunAdvertisingScripts()
	};

	// set current consent level to the window
	window.invisionUtils.consent = consent;

	const isDev = window.invisionUtils.isDev;

	if ( isDev ) {
		console.log('STORAGECONSENT: consent', consent);
	}

	// load scripts for category
	if ( category !== 'all' && consent[category] ) {
		invisionUtils.scripts[category].forEach(function(script) {
			script();
		});

		if ( isDev ) {
			console.log('STORAGECONSENT: ' + category.charAt(0).toUpperCase() + category.slice(1) + ' Scripts Loaded(',window.invisionUtils.scripts[category].length,')');
		}

		// reset the script buffer
		window.invisionUtils.scripts[category] = [];
	} else {

		// load all scripts

		// load functional scripts
		if ( consent.functional ) {
			invisionUtils.scripts.functional.forEach(function(script) {
				script();
			});

			if ( isDev ) {
				console.log('STORAGECONSENT: Functional Scripts Loaded(',window.invisionUtils.scripts.functional.length,')');
			}

			// reset the script buffer
			window.invisionUtils.scripts.functional = [];
		}

		// load advertising scripts
		if ( consent.advertising ) {
			invisionUtils.scripts.advertising.forEach(function(script) {
				script();
			});

			if ( isDev ) {
				console.log('STORAGECONSENT: Advertising Scripts Loaded(',window.invisionUtils.scripts.advertising.length,')');
			}

			// reset the script buffer
			window.invisionUtils.scripts.advertising = [];
		}
	}

	window.invisionUtils.loaded = true;
};

window.invisionUtils.embedStorageConsentScript = window.invisionUtils.embedStorageConsentScript || function(version,callback) {
	(function(d, s, id){
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)){ return; }
		js = d.createElement(s); js.id = id;
		js.onload = function(){
			// remote script has loaded
			window.invisionUtils.initialize(callback);
		};
		js.src = "/assets/storage-consent/snippet.js?v=" + version;
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'inv-onetrust-embed'));
};

// This uses the storage consent library to handle changes
window.invisionUtils.initialize = window.invisionUtils.initialize || function(cb) {

	// we only need to initialize once
	if ( window.invisionUtils.initialized ) {
		return;
	}
	
	const handleConsentLevelChanges = function() {

		// load all available scripts
		window.invisionUtils.loadScripts();

	};
	
	window.StorageConsent.onConsentLevelReady(handleConsentLevelChanges);
	window.StorageConsent.onConsentLevelChange(handleConsentLevelChanges);

	window.invisionUtils.initialized = true;

	// if there's a passed callback, call it
	if ( cb ) {
		cb();
	}
};