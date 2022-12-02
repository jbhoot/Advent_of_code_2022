let reduce acc curr =
  match curr with
  | "" -> (
    match acc with
    | [] -> []
    | lst -> 0 :: lst)
  | v -> (
    match acc with
    | [] -> [ v |> int_of_string ]
    | hd :: tl -> ((v |> int_of_string) + hd) :: tl)

let () =
  "./inputs/d1_1.txt" |> Arg.read_arg |> Array.to_list
  |> List.fold_left reduce []
  |> List.fold_left
       (fun acc curr ->
         if acc >= curr then
           acc
         else
           curr)
       0
  |> string_of_int |> print_endline
