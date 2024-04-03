#!/usr/bin/env ocaml
#use "topfind"
#require "topkg"
open Topkg

let cmdliner = Conf.with_pkg "cmdliner"
let extlib = Conf.with_pkg "extlib"

let () =
  Pkg.describe "cmarkit" @@ fun c ->
  let cmdliner = Conf.value c cmdliner in
  let extlib = Conf.value c extlib in
  let api = ["Cmarkit_pervasives"; "Cmarkit"; "Cmarkit_renderer";
             "Cmarkit_commonmark"; "Cmarkit_html"; "Cmarkit_latex"]
  in
  Ok [ Pkg.mllib ~api "src/cmarkit.mllib";
       Pkg.doc "doc/index.mld" ~dst:"odoc-pages/index.mld";
       Pkg.bin ~cond:(cmdliner && not extlib) "tool/cmd_main" ~dst:"cmarkit" ]
