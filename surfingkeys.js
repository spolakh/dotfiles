var command_map = {};
function _parseAnnotation(ag) {
    var annotations = ag.annotation.match(/#(\d+)(.*)/);
    if (annotations !== null) {
        ag.feature_group = parseInt(annotations[1]);
        ag.annotation = annotations[2];
    }
    return ag;
}

function command(cmd, annotation, jscode) {
    var cmd_code = {
        code: jscode
    };
    var ag = _parseAnnotation({annotation: annotation, feature_group: 14});
    cmd_code.feature_group = ag.feature_group;
    cmd_code.annotation = ag.annotation;
    command_map[cmd] = cmd_code;
}


mapkey('<Ctrl-s>', 'Print all mappings to console', function () {
    const feature_groups = [
        'Help',                  // 0
        'Mouse Click',           // 1
        'Scroll Page / Element', // 2
        'Tabs',                  // 3
        'Page Navigation',       // 4
        'Sessions',              // 5
        'Search selected with',  // 6
        'Clipboard',             // 7
        'Omnibar',               // 8
        'Visual Mode',           // 9
        'vim-like marks',        // 10
        'Settings',              // 11
        'Chrome URLs',           // 12
        'Proxy',                 // 13
        'Misc',                  // 14
        'Insert Mode',           // 15
    ];

    let keyMappings = [Normal.mappings,
        Visual.mappings,
        Insert.mappings
    ].map(getAnnotations).reduce(function (a, b) {
        return a.concat(b);
    });

    keyMappings = keyMappings.map(annotation => {
        let category_name = feature_groups[annotation.feature_group];
        return {
            category: category_name,
            trigger: KeyboardUtils.decodeKeystroke(annotation.word) + ` (${category_name})`,
            description: annotation.annotation
        };
    });

    console.log(command_map);
    let commands = Object.keys(command_map).map((commandName) => {
        console.log("processing: " + commandName);
        let cmd = command_map[commandName];
        let category_name = feature_groups[cmd.feature_group];
        return {
            category: category_name,
            trigger: `:${commandName} (${category_name})`,
            description: cmd.annotation
        }
    });

    console.log(keyMappings.concat(commands));
    console.log(JSON.stringify(keyMappings.concat(commands)));
});
//------------

(function updateSearchAliases() {
    // //google to ss, stackoverflow to st
    // map('ss', 'sg');
    // map('st', 'ss');

    addSearchAliasX('s', 'google', 'https://www.google.com/search?q=', 's', 'https://www.google.com/complete/search?client=chrome-omni&gs_ri=chrome-ext&oit=1&cp=1&pgcl=7&q=', function(response) {
        var res = JSON.parse(response.text);
        return res[1];
    });

    addSearchAliasX('t', 'stackoverflow', 'http://stackoverflow.com/search?q=');
})();

//swap edit url things, as I seem to be wanting edit and reload more then other one
map('su', 'sU');
// map('sU', 'su');
mapkey('sU', '#4Edit current URL with vim editor, and open in new tab', function() {
    Front.showEditor(window.location.href, function(data) {
        tabOpenLink(data);
    }, 'url');
});

// map('F', 'af'); //back to good ol' cVim days
// seems like F is independantly useful :p

mapkey('ye', "#7Copy last part of page URL", function() {
    let parts = window.location.pathname.split('/');
    let lastSegment = parts.pop() || parts.pop(); // to handle case with trailing '/'

    Clipboard.write(lastSegment);
});

//Roam stuff
settings.clickableSelector= "*.roam-block, *.rm-block-ref, *.rm-title-display";

function triggerMouseEvent (node, eventType, triggerWithShift=true) {
    let clickEvent = document.createEvent ('MouseEvents');   
                     
    clickEvent.initMouseEvent(eventType, true, true, window, 0, 0, 0, 0, 0, false, false, triggerWithShift, false, 0, document.body.parentNode);
                     
    node.dispatchEvent (clickEvent);
}

mapkey('F', 'Roamclick', function() {
    //todo need to scope this to roam
    Hints.create("", function(element, event) {
        triggerMouseEvent(element, "mousedown");
    }, {domain: /roamresearch\.com/i});
});

// Clean out "select to trigger inline query" list. Very annoying
settings.mouseSelectToQuery = [];

// Disable emoji popup. I can see it being potentially useful, but most of the time it's annoying and I already have this via Alfred
iunmap(":");

