# Self study

## Find

- Find out how to access files with and without code blocks. What is the benefit of the code block?
  With no associated block, File.open is a synonym for File.new. If the optional code block is given, it will be passed the opened file as an argument and the File object will automatically be closed when the block terminates. The value of the block will be returned from File.open.
- How would you translate a hash to an array? Can you do the opposite?
  Hash class has a `to_a` method in to translate a Map into an Array. There is also a `to_h` method in Array, we can do this:

  ```ruby
  hash_map = {:buzik => 'Salvador', :panda => 'Eva', :papa => 'Ruben'}
  arr = hash_map.to_a
  # This would be [[:buzik, 'Salvador'], [:panda, 'Eva'], [:papa, 'Ruben']]
  # Dummy option 1
  n_hash_map = {}
  arr.each { |el| n_map[el.first] = el[1] }

  # Option 2
  # Reference https://devdocs.io/ruby~3/array#method-i-to_h
  n_has_map = arr.to_h
  # returns {:buzik => 'Salvador', :panda => 'Eva', :papa => 'Ruben'}
  ```

- Can you iterate through a hash?
  Most def :), there are a couple of ways of doing this but this one seems the more appropriate to me, here's an example:
  ```ruby
    map = {:buzik => 'Salvador', :panda => 'Eva', :papa => 'Ruben'}
    map.each { |key, value| puts "Key is #{key} and value is #{value}" }
  ```
- You can use Ruby arrays as stacks. What other common data structures do arrays support?
  Queues

## Tasks

- Print the contents of an array of sixteen number, four numbers at a time, using `each`. Now, do the same with `each_slice` in Enumerable.
  With `each_slice` is simple, no surprise :):

```ruby
    (1..16).each_slice(4) { |a| p a }
    # prints [1,2,3,4] [5,6,7,8], [9,10,11,12], [13, 14,15,16]
```

- The Tree class was interesting, but it did not allow you to specify a new tree with a clean user interface. Let the initializer accept a nested structure with hashes and arrays. You should be able to specify a tree like this:

```ruby
const tree = Tree.new {’grandpa’ =>
                        { ’dad’ => { ’child 1’ => {}, ’child 2’ => {} },
                          ’uncle’ => {’child 3’ => {}, ’child 4’ => {} }
                        }
                      }
```

- Write a simple grep that will print the lines of a file having any occurrences of a phrase anywhere in that line. You will need to do a simple regular expression match and read lines from a file. Include line numbers if you want.
