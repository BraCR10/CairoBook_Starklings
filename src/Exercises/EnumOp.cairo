// This function returns how much icecream there is left in the fridge.
// If it's before 10PM, there's 5 pieces left. At 10PM, someone eats them
// all, so there'll be no more left :(
    fn maybe_icecream(
        time_of_day: usize
    ) -> Option<usize> { // We use the 24-hour system here, so 10PM is a value of 22 and 12AM is a value of 0
    // The Option output should gracefully handle cases where time_of_day > 23.
    // TODO: Complete the function body - remember to return an Option!
       if time_of_day<22{
            Option::Some(5)
       }else if time_of_day>=22{
            Option::Some(0)
       }else{
            Option::None
       }
    }
    
    fn simple_option(optional_target: Option<felt252>) {
        // TODO: use the `is_some` and `is_none` methods to check if `optional_target` contains a value.
        // Place the assertion and the print statement below in the correct blocks.
        if optional_target.is_some() {
            assert(optional_target.unwrap() == 'starklings', 'err1');
        } else {
            println!("There is no value!");
        }
    }
    
fn main () {
    let time = 12;
    let icecream = maybe_icecream(time).unwrap();
    println!("Icecream left: {}", icecream);
}