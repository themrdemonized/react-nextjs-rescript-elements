let default = () => {
  let c = (_) => ()

  <div>
    <CheckboxComponent
      type_={M}
      updateModelValue={c}
      props={
        style: {ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
      }
    />
    <CheckboxComponent
      type_={S}
      updateModelValue={c}
      props={
        style: {ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
      }
    />
    <CheckboxComponent
      disabled=true
      updateModelValue={c}
      props={
        style: {ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
      }
    />
    <CheckboxComponent
      isError=true
      updateModelValue={c}
      props={
        style: {ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
      }
    />
    <CheckboxComponent
      modelValue={True}
      disabled=true
      isError=true
      updateModelValue={c}
      props={
        style: {ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
      }
    />
    <CheckboxComponent
      mode={Parted}
      modelValue={Parted}
      updateModelValue={c}
      props={
        style: {ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
      }
    />
    <CheckboxComponent
      type_={M}
      updateModelValue={c}
      props={
        style: {ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())},
      }
    >
      {React.string("Test text")}
    </CheckboxComponent>
    <CheckboxComponent
      type_={S}
      updateModelValue={c}
      props={
        style: {ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
      }
    >
      {React.string("Small test text")}
    </CheckboxComponent>
    <CheckboxComponent
      disabled=true
      updateModelValue={c}
      props={
        style: {ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
      }
    >
      {React.string("Disabled test text")}
    </CheckboxComponent>
    <CheckboxComponent
      isError=true
      updateModelValue={c}
      props={
        style: {ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
      }
    >
      {React.string("Errored test text")}
    </CheckboxComponent>
    <CheckboxComponent
      disabled=true
      modelValue=True
      updateModelValue={c}
      props={
        style: {ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
      }
    >
      {React.string("Disabled checked test text")}
    </CheckboxComponent>
    <CheckboxComponent
      modelValue=Parted
      mode={Parted}
      updateModelValue={c}
      props={
        style: {ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
      }
    >
      {React.string("Parted value test text")}
    </CheckboxComponent>
  </div>
}
