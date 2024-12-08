use core::dict::Felt252Dict;
use core::nullable::{NullableTrait, match_nullable, FromNullableResult};

#[derive(Drop,Copy, Debug)]
struct Product {
    id: u64,
    name: felt252,
    price: u64,
    category: Category,
}

#[derive(Drop,Copy,Debug)]
enum Category {
    Electronics,
    Gaming,
    Books,
    Clothing,
    Souvenirs,
    Food
}

#[generate_trait]
impl ProductImpl of ProductTrait {
    fn new(id: u64, name: felt252, price: u64,cat: Category) -> Product {
        Product {
            id,
            name,
            price,
            category: cat
        }
    }

    fn set_price(ref self: Product, price: u64) {
        self.price = price;
    }

    fn get_price(self: @Product) -> u64 {
        *self.price
    }

    fn get_category(self: @Product) -> Category {
        *self.category
    }

    fn set_category(ref self: Product, cat: Category) {
        self.category = cat;
    }

    fn get_id(self: @Product) -> u64 {
        *self.id
    }
}

fn main() {
    let mut inventory: Felt252Dict<Nullable<Product>> = Default::default();
    let mut computer = ProductTrait::new(id:1, name:'Computer',  price:1000,cat:Category::Electronics);
    computer.set_price( 1600);
    computer.set_category(Category::Gaming);

    inventory.insert(computer.id.into(), NullableTrait::new(computer));
    inventory.insert(2, NullableTrait::new(ProductTrait::new(id:2, name:'Book',price:20,cat:Category::Books)));

    let proct = inventory.get(1);

    // Search the value and assert it is not null
    match match_nullable(proct) {
        FromNullableResult::Null => println!("Not found"),
        FromNullableResult::NotNull=> {
            println!("Product: {:?}", proct);
        }
    };
   

}