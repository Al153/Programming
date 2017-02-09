       
let rec read_lines () =
    try let line = read_line () in
        int_of_string (line) :: read_lines()
    with
        End_of_file -> [];;



let () =
    let n::arr = read_lines() in
    let ans = .... in
    List.iter (fun x -> print_int x; print_newline ()) ans;;



let rec print = function
    | 0 -> ()
    | n -> (print_endline "Hello World" ; print(n-1))
in let n = read_int() in print n;;