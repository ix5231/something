open React.Dom.Dsl
open Html

let%component make () =
  let (count, set_count) = React.use_state (fun () -> 0) in
  div [||] [
    p [||] [React.string "Hello world from OCaml with Ix"];
    p [||] [button [| onClick (fun _ -> set_count (fun c -> c + 1)) |] [React.string "Push!"]];
    p [||] [React.string (Int.to_string count)]
  ] 
