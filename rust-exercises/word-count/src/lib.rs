use std::collections::HashMap;

/// Count occurrences of words.
pub fn word_count(phrase: &str) -> HashMap<String, u32> {
  let mut map = HashMap::new();
  
  let new_phrase = phrase.to_lowercase();
  
  for word in new_phrase.split_whitespace() {
    if map.contains_key(word) {
      if let Some(count) = map.get_mut(word) {
        *count += 1;
      }
    } else {
      map.insert(word.to_lowercase().to_string(), 1); //must do .to_string() bc its a &str
    }
  }
  map
}