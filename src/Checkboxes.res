let default = () => {
  let c = (_) => ()

  <div>
    <CheckboxComponent
      type_={M}
      updateModelValue={c}
      style={ReactDOM.Style.make(~marginBottom="16px", ())}
    />
    <CheckboxComponent
      type_={M}
      updateModelValue={c}
      style={ReactDOM.Style.make(~marginBottom="16px", ())}
    >
      {React.string("Test text")}
    </CheckboxComponent>
    <CheckboxComponent
      type_={S}
      updateModelValue={c}
      style={ReactDOM.Style.make(~marginBottom="16px", ())}
    >
      {React.string("Small test text")}
    </CheckboxComponent>
    <CheckboxComponent
      disabled=true
      updateModelValue={c}
      style={ReactDOM.Style.make(~marginBottom="16px", ())}
    >
      {React.string("Disabled test text")}
    </CheckboxComponent>
    <CheckboxComponent
      isError=true
      updateModelValue={c}
      style={ReactDOM.Style.make(~marginBottom="16px", ())}
    >
      {React.string("Errored test text")}
    </CheckboxComponent>
    <CheckboxComponent
      disabled=true
      modelValue=True
      updateModelValue={c}
      style={ReactDOM.Style.make(~marginBottom="16px", ())}
    >
      {React.string("Disabled checked test text")}
    </CheckboxComponent>
    <CheckboxComponent
      modelValue=Parted
      mode={Parted}
      updateModelValue={c}
      style={ReactDOM.Style.make(~marginBottom="16px", ())}
    >
      {React.string("Parted value test text")}
    </CheckboxComponent>
  </div>
}
