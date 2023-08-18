let default = () => {
  let (count, setCount) = React.useState(() => 0)

  <div>
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      value={`default count is ${count->Belt.Int.toString}`}
      style={ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
    />
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      typeColor={Secondary}
      value={`Secondary count is ${count->Belt.Int.toString}`}
      style={ReactDOM.Style.make(~marginBottom="16px", ())}
    />
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      typeColor={Tertiary}
      value={`Tertiary count is ${count->Belt.Int.toString}`}
      style={ReactDOM.Style.make(~marginBottom="16px", ())}
    />
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      typeSize={L}
      value={`Large count is ${count->Belt.Int.toString}`}
      style={ReactDOM.Style.make(~marginBottom="16px", ())}
    />
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      typeSize={S}
      value={`Small count is ${count->Belt.Int.toString}`}
      style={ReactDOM.Style.make(~marginBottom="16px", ())}
    />
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      disabled=true
      value={`Disabled count is ${count->Belt.Int.toString}`}
      style={ReactDOM.Style.make(~marginBottom="16px", ())}
    />
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      value={`Hidden div count is ${count->Belt.Int.toString}`}
      style={ReactDOM.Style.make(~marginBottom="16px", ())}
      type_="text"
    />
    <ButtonComponent
      onClick={_ => setCount(count => count + 1)}
      iconWithTextSlot={
        <div
          style={ReactDOM.Style.make(
            ~width="16px",
            ~height="16px",
            ()
          )}
        >
          <svg style={ReactDOM.Style.make(~display="block", ())} viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M6.68374 3.54692C7.26832 2.58816 8.33161 2 9.48029 2H13.0653C13.3049 2 13.4536 2.25269 13.3317 2.45267L7.69149 11.7031C7.10691 12.6618 6.04362 13.25 4.89494 13.25H1.30987C1.07027 13.25 0.9216 12.9973 1.04353 12.7973L6.68374 3.54692Z" fill="currentColor"/>
            <path d="M14.5359 8.3C14.7922 8.3 15 8.50147 15 8.75V11.15C15 12.724 13.684 14 12.0607 14H10.2043C9.94796 14 9.74017 13.7985 9.74017 13.55V11.15C9.74017 9.57599 11.0561 8.3 12.6795 8.3H14.5359Z" fill="currentColor"/>
          </svg>
        </div>
      }
      value={`icon count is ${count->Belt.Int.toString}`}
      style={ReactDOM.Style.make(~marginBottom="16px", ())}
    />
  </div>
}
