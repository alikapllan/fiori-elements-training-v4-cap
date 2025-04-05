using project from '../db/schema';

service CatalogService {
    entity Products as projection on project.Products;
}

annotate CatalogService.Products with @(
    UI.LineItem: [
        { Value: productName, Label: 'Products' },
        { Value: category, Label: 'Category' },
        { Value: price, Label: 'Price' },
    ]
);

// Add Support oData V4 Analytics
annotate CatalogService.Products with @(
    Aggregation.ApplySupported: {
        Transformations: [ 'aggregate' ],
        GroupableProperties: [ category, productName, ID ],
        AggregatableProperties: [{
            Property: price,
            @Common.Label: 'Total Price'
        }]
    }
);

// Add Aggregate definition price
annotate CatalogService.Products with @(
    Aggregation.CustomAggregate #price : 'Edm.Decimal',
    Common.SemanticKey: [ID]
){
    ID  @ID:'ID';
    price @Analytics.Measure : true @Aggregation.default: #SUM;
};

// Definition of chart
annotate CatalogService.Products with @(
   Analytics.AggregatedProperty #totalPrice: {
        AggregatableProperty: price,
        AggregationMethod: 'sum',
        Name: 'totalPrice'
   }
);
annotate CatalogService.Products with @(
    UI.Chart #sampleAnalytics:{
        ChartType: #Line,
        Title: 'Price vs Category',
        Dimensions: [category],
        DynamicMeasures: [
            '@Analytics.AggregatedProperty#totalPrice'
        ],
        MeasureAttributes: [{
            DynamicMeasure: '@Analytics.AggregatedProperty#totalPrice',
            Role: #Axis1
        }],
        DimensionAttributes: [{
            Dimension: category,
            Role: #Category
        }]
    }
);