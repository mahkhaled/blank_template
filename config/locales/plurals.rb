/*{  :ar => { :i18n => { :plural => { :keys => [:zero, :one, :two, :few, :many, :other], :rule => lambda { |n| n == 0 ? :zero : n == 1 ? :one : n == 2 ? :two : [3, 4, 5, 6, 7, 8, 9, 10].include?(n % 100) ? :few : [11..99].include?(n % 100) ? :many : :other } } } }
}
 */

{  :ar => { :i18n => { :plural => { :keys => [:one, :other], :rule => lambda { |n| (n == 1 || (11..99).include?(n % 100)) ? :one : :other } } } }
}

 
