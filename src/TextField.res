let default = () => {
  let (lastInput, setLastInput) = React.useState(() => "")

  let onChange = (s) => {
    setLastInput(_ => s)
  }
  <div>
    <p>{React.string(`Last input: ${lastInput}`)}</p>
    <TextFieldComponent
      onChange={onChange}
    >
      {React.string("Title")}
    </TextFieldComponent>
    <TextFieldComponent
      onChange={onChange}
      isError=true
      props={
        style: {ReactDOM.Style.make(~margin="16px 0", ())}
      }
    >
      {React.string("Error")}
    </TextFieldComponent>
    <TextFieldComponent
      onChange={onChange}
      disabled=true
      props={
        style: {ReactDOM.Style.make(~margin="16px 0", ())}
      }
    >
      {React.string("Disabled")}
    </TextFieldComponent>
    <TextFieldComponent
      onChange={onChange}
      disabled=true
      isError=true
      props={
        style: {ReactDOM.Style.make(~margin="16px 0", ())}
      }
    >
      {React.string("Disabled error")}
    </TextFieldComponent>
    <TextFieldComponent
      onChange={onChange}
      forceWithContentState=true
      props={
        style: {ReactDOM.Style.make(~margin="16px 0", ())}
      }
    >
      {React.string("Force upper caption")}
    </TextFieldComponent>
    <TextFieldComponent
      onChange={onChange}
      contentSlot={<IconPlusSmall />}
      props={
        style: {ReactDOM.Style.make(~margin="16px 0", ())}
      }
    >
      {React.string("With content")}
    </TextFieldComponent>
    <TextFieldComponent
      onChange={onChange}
      autoselect=true
      props={
        style: {ReactDOM.Style.make(~margin="16px 0", ())}
      }
    >
      {React.string("Autoselect")}
    </TextFieldComponent>
    <TextFieldComponent
      onChange={onChange}
      autofocus=true
      props={
        style: {ReactDOM.Style.make(~margin="16px 0", ())}
      }
    >
      {React.string("Autofocus")}
    </TextFieldComponent>
  </div>
}
