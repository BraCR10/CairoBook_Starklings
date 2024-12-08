#[derive(Drop, Debug)]
struct Car {
    id: u64,
    model: u64,
    year: u64,
    velocity: u64,
}

#[generate_trait]
impl CarImpl of CarTrait {
    fn new(id: u64, model: u64, year: u64, velocity: u64) -> Car {
        Car {
            id,
            model,
            year,
            velocity,
        }
    }

    fn accelerate(ref self: Car, velocity: u64) {
        self.velocity += velocity;
    }

    fn brake(ref self: Car, velocity: u64) {
        if velocity > self.velocity {
            self.velocity = 0;
        } else {
            self.velocity -= velocity;
        }
    }

    fn get_velocity(self: @Car) -> u64 {
        *self.velocity
    }
}

fn main() {
    let mut car = CarTrait::new(id:1, model:10,  year:2024,velocity:0);
    car.accelerate( 100);
    println!("Velocity: {}", CarTrait::get_velocity(@car));
    car.brake( 50);
    println!("Velocity: {}", car.get_velocity());

    car.accelerate( 100);

    println!("Car state: {:?}", car);
}