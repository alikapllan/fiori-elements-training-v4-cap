using project from '../db/schema';

service CatalogService {
    entity Products as projection on project.Products;
}