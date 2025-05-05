(*---------------------------------------------------------------------------
   Copyright (c) 2023 The cmarkit programmers. All rights reserved.
   SPDX-License-Identifier: ISC
  ---------------------------------------------------------------------------*)

let test_mapper_table_bug_14 () =
  let table =
    "| a | b | c |\n\
     |---|---|---|\n\
     | a | b | c |\n\
     |   | b | c |\n\
     |   |   | c |\n"
  in
  let doc = Cmarkit.Doc.of_string ~layout:true ~strict:false table in
  let mdoc = Cmarkit.Mapper.map_doc (Cmarkit.Mapper.make ()) doc in
  print_endline "Expectation for mapper table bug #14:\n";
  print_endline (Cmarkit_commonmark.of_doc mdoc);
  ()

let test_inline_normalize () =
  let open Cmarkit in
  let m n = n, Meta.none in

  let inline = Inline.Inlines (m [
    Inline.Text (m "a");
    Inline.Text (m "b");
    Inline.Text (m "c");
    Inline.Text (m "d");
  ]) in
  let normalized = Inline.normalize inline in
  let block = Block.Paragraph (m (Block.Paragraph.make normalized)) in
  let doc = Doc.make block in
  Printf.printf "Normalized: %s\n" (Cmarkit_commonmark.of_doc doc)

let main () =
  test_mapper_table_bug_14 ();
  test_inline_normalize ();
  ()

let () = if !Sys.interactive then () else main ()
