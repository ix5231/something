let pitches = [| "C"; "C#"; "D"; "D#"; "E"; "F"; "F#"; "G"; "G#"; "A"; "A#"; "B" |]

let tryDominantOf p =
  match Array.tryFindIndex ((=) p) pitches with
  | Some idx -> Array.tryItem ((idx + 7) % pitches.Length) pitches
  | None -> None

printfn "%A" (tryDominantOf (stdin.ReadLine()))