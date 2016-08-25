"use strict";
var fs = require('fs'),
meta = module.parent.require('./meta'),
controllers = require('./controllers/controllers'),
adblock = {};

adblock.init = function(params, callback) {
    var router = params.router,
        hostMiddleware = params.middleware,
        hostControllers = params.controllers;

    router.get('/admin/plugins/adblock', hostMiddleware.admin.buildHeader, controllers.renderAdminPage);
    router.get('/api/admin/plugins/adblock', controllers.renderAdminPage);
    meta.settings.get('adblock', function(err, options) {
       fs.writeFile("public/adblock.config.json", JSON.stringify(options), function (err){})
    });
    callback();
};

adblock.addAdminNavigation = function(header, callback) {
    header.plugins.push({
        route: '/plugins/adblock',
        icon: 'fa-tint',
        name: 'Adblock'
    });

    callback(null, header);
};

adblock.deactivateAdblock = function(id){
    if (id === 'nodebb-plugin-adblock') {
        fs.unlink("public/adblock.config.json", function (){})
        }
};
module.exports = adblock;