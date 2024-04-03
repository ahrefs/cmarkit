module List = struct
  include ExtLib.List
  let sort cmp l = sort ~cmp l
end

module String = struct
  include ExtLib.String
  let starts_with = String.starts_with
  let get_utf_8_uchar = String.get_utf_8_uchar
  let for_all = String.for_all
  let exists = String.exists
end

module Option = struct
  include Option
  let bind = Stdlib.Option.bind
  let value = Stdlib.Option.value
end