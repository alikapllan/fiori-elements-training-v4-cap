sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'fiorielementsv4capanalyticalpage/test/integration/FirstJourney',
		'fiorielementsv4capanalyticalpage/test/integration/pages/ProductsList',
		'fiorielementsv4capanalyticalpage/test/integration/pages/ProductsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ProductsList, ProductsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('fiorielementsv4capanalyticalpage') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheProductsList: ProductsList,
					onTheProductsObjectPage: ProductsObjectPage
                }
            },
            opaJourney.run
        );
    }
);