open Printf

let help =
  Str.global_replace (Str.regexp @@ Str.quote ".ml") "" __FILE__ ^ " [ARG1] [ARG2]\n"
;;

let exit_with_help n =
  print_string help;
  exit n
;;

let gcd a b =
  let rec iter a_ b_ = if b_ = 0 then a_ else iter b_ (a_ mod b_) in
  iter a b
;;

let divide_by_gcd a b gcd_ = if min a b = 0 then a, b else a / gcd_, b / gcd_

let parse_arg arg =
  try int_of_string arg with
  | _ -> exit_with_help 2
;;

let () =
  let args = Sys.argv in
  if Array.length args <> 3 then exit_with_help 1;
  let arg1, arg2 = parse_arg args.(1), parse_arg args.(2) in
  let divisor = gcd arg1 arg2 in
  let a, b = divide_by_gcd arg1 arg2 divisor in
  printf "%.1f x %.1f\n" (float a) (float b)
;;
