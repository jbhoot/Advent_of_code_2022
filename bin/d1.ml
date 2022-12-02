let aggregate lst =
  List.fold_left
    (fun acc curr ->
      match curr with
      | "" -> (
        match acc with
        | [] -> []
        | lst -> 0 :: lst)
      | v -> (
        match acc with
        | [] -> [ v |> int_of_string ]
        | hd :: tl -> ((v |> int_of_string) + hd) :: tl))
    [] lst

let sort lst =
  List.sort
    (fun a b ->
      if a > b then
        1
      else if a = b then
        0
      else
        -1)
    lst

let () =
  let agg =
    "./inputs/d1.txt" |> Arg.read_arg |> Array.to_list |> aggregate |> sort
    |> List.rev
  in
  let first_answer = agg |> List.hd in
  let second_answer =
    match agg with
    | fst :: snd :: thrd :: _ -> fst + snd + thrd
    | _ -> failwith "Less than three items in the list"
  in
  print_newline ();
  print_endline
    ("Highest number of calories with an elf: "
    ^ (first_answer |> string_of_int));

  print_endline
    ("Highest number of calories with 3 elves: "
    ^ (second_answer |> string_of_int))
