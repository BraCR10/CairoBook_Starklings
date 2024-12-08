fn main() {
    let mut arr = array![1, 2, 3, 4, 5, 6, 7, 8, 9];
    let mut sum = 0;
    while let Option::Some(value) = arr.pop_front() {
        sum += value;
    };
    println!("While let : {}", sum);
    
    let mut sum = 0;
    let mut arr = array![1, 2, 3, 4, 5, 6, 7, 8, 9];
    let mut iter = arr.len();
    while iter > 0 {
        sum += arr.pop_front().unwrap();
        iter -= 1;
    };
    println!("Common While : {}", sum);

    let mut sum = 0;
    let mut arr = array![1, 2, 3, 4, 5, 6, 7, 8, 9];
    let mut iter = 0;
    while iter < arr.len() {
        sum += *arr.at(iter);
        iter += 1;
    };
    println!("Common While with at : {} the array stillS full {}", sum, arr.len());
}