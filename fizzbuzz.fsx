let fizzbuzzImpl n =
    match n with
    | n when n % 15 = 0 -> "FizzBuzz"
    | n when n % 3 = 0 -> "Fizz"
    | n when n % 5 = 0 -> "Buzz"
    | n -> n.ToString()

let fizzbuzz n = Array.map fizzbuzzImpl [| 1..n |]

printfn "%s" (fizzbuzz 100 |> String.concat "\n")
