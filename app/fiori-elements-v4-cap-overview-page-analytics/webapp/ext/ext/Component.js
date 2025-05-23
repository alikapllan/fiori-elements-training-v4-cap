sap.ui.define(["sap/ovp/cards/custom/Component", "jquery.sap.global"],
    function (CardComponent, jQuery) {
        "use strict";
    
        return CardComponent.extend("fiorielementsv4capoverviewpageanalytics.ext.ext.Component", {
        // use inline declaration instead of component.json to save 1 round trip
        metadata: {
            properties: {
            contentFragment: {
                type: "string",
                defaultValue: "fiorielementsv4capoverviewpageanalytics.ext.ext.customCardOverviewPage",
            },
            headerFragment: {
                type: "string",
                defaultValue: "",
            },
            footerFragment: {
                type: "string",
                defaultValue: "",
            },
            },
    
            version: "${version}",
    
            library: "sap.ovp",
    
            includes: [],
    
            dependencies: {
            libs: ["sap.m"],
            components: [],
            },
            config: {},
            customizing: {
            "sap.ui.controllerExtensions": {
                "sap.ovp.cards.generic.Card": {
                controllerName: "fiorielementsv4capoverviewpageanalytics.ext.ext.customCardOverviewPage",
                },
            },
            },
        },
        });
    }
    );