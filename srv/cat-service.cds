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
