module List : sig
  include module type of ExtLib.List
  val sort : ('a -> 'a -> int) -> 'a list -> 'a list
end

module String : sig
  include module type of ExtLib.String
  val starts_with : prefix:string -> string -> bool
  val get_utf_8_uchar : string -> int -> Uchar.utf_decode
  val for_all : (char -> bool) -> string -> bool
  val exists : (char -> bool) -> t -> bool
end

module Option : sig
  include module type of Option
  val bind : 'a option -> ('a -> 'b option) -> 'b option
  val value : 'a option -> default:'a -> 'a
end
