namespace project;

entity Products {
  key ID : UUID;
  productName : String @title: 'Product Name';
  category : String @title: 'Category';
  price : Decimal(16, 3);
   // price : Integer;
  description : String; // New field for product description
  image : String; // New field for image URL
}
