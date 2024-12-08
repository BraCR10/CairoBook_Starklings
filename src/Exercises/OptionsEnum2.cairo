#[derive(Drop)]
struct Student {
    name: felt252,
    courses: Array<Option<felt252>>,
}


fn display_grades(student: @Student, index: usize) {

    if index == 0 {
        println!("{} index 0", *student.name);
    }
    
    if index >= student.courses.len() {
        return ();
    }

    let course = *student.courses.at(index);

    // TODO: Modify the following lines so that if there is a grade for the course, it is printed.
    //       Otherwise, print "No grade".
    match course{
    
        Option::Some=>println!("grade is {}", course.unwrap()),
        Option::None=>println!("No grade"),
    }
    display_grades(student, index + 1);
}

fn main() {
    let student = Student {
        name: 'Alice',
        courses: array![Option::Some(90), Option::None, Option::Some(80)],
    };
    display_grades(@student, 0);
}