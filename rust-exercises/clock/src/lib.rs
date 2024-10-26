use std::fmt;

#[derive(PartialEq, PartialOrd, Debug)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let time_in_minutes = (hours*60 + minutes).rem_euclid(24*60);
        Clock { hours: (time_in_minutes/60), minutes: (time_in_minutes%60) }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        let time_in_min = (self.hours * 60 + self.minutes + minutes).rem_euclid(24*60);
        Clock::new(time_in_min/60 , time_in_min%60)
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.hours, self.minutes)
    }
}
