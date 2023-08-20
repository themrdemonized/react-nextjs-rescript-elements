@send external blur: Dom.element => unit = "blur"
@send external click: Dom.element => unit = "click"
@send external focus: Dom.element => unit = "focus"
@get external selectionStart: Dom.element => option<int> = "selectionStart"
@send external setSelectionRange: (Dom.element, int, int) => unit = "setSelectionRange"
type typeSizes = M
@react.component
let make: (
  ~name: string=?,
  ~autocomplete: string=?,
  ~type_: string=?,
  ~typeValue: string=?,
  ~modelValue: string=?,
  ~typeSize: typeSizes=?,
  ~disabled: bool=?,
  ~isError: bool=?,
  ~autoselect: bool=?,
  ~autofocus: bool=?,
  ~forceWithContentState: bool=?,
  ~forceFocusState: bool=?,
  ~updateModelValueOnInput: bool=?,
  ~onChange: string => unit=?,
  ~onInput: string => unit=?,
  ~updateModelValue: string => unit=?,
  ~onFocus: unit => unit=?,
  ~onBlur: unit => unit=?,
  ~onKeyUp: ReactEvent.Keyboard.t => unit=?,
  ~contentSlot: React.element=?,
  ~children: React.element=?,
  ~props: ReactDOM.domProps=?,
) => React.element
