let default = () => {
  let c = (tool) => (
    Js.Console.log("clicked tool " ++ tool)
  )

  <div>
    <PopoverComponent
      props={
        style: {ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
      }
    >
      {React.string("Small content")}
    </PopoverComponent>
    <PopoverComponent
      props={
        style: {ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
      }
      tools={[
        "edit",
        "copy"
      ]}
      toolTemplates={[
        <IconPencil />,
        <IconDocOnDoc />
      ]}
      clickTool={c}
    >
      {React.string("Small content with tools")}
    </PopoverComponent>
    <PopoverComponent
      props={
        style: {ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
      }
    >
      {React.string("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla libero elit, porttitor nec egestas in, congue a lorem. Suspendisse vitae dolor non tortor hendrerit rhoncus. In hac habitasse platea dictumst. Sed bibendum aliquet sollicitudin. Suspendisse luctus mauris dignissim ligula dignissim porttitor. Integer ut metus facilisis, pharetra augue et, luctus tortor. Suspendisse molestie risus lorem, quis sagittis odio venenatis vel. Donec luctus commodo dolor ut sollicitudin. Cras faucibus sit amet odio vitae tincidunt. Suspendisse potenti. Proin odio nunc, hendrerit ut est eu, finibus consectetur urna. Quisque nec tincidunt eros. Cras tincidunt, lacus ac vehicula tincidunt, massa odio accumsan sem, non venenatis tortor lorem in orci.")}
    </PopoverComponent>
    <PopoverComponent
      props={
        style: {ReactDOM.Style.make(~marginTop="16px", ~marginBottom="16px", ())}
      }
      tools={[
        "edit",
        "copy"
      ]}
      toolTemplates={[
        <IconPencil />,
        <IconDocOnDoc />
      ]}
      clickTool={c}
    >
      {React.string("Tools: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla libero elit, porttitor nec egestas in, congue a lorem. Suspendisse vitae dolor non tortor hendrerit rhoncus. In hac habitasse platea dictumst. Sed bibendum aliquet sollicitudin. Suspendisse luctus mauris dignissim ligula dignissim porttitor. Integer ut metus facilisis, pharetra augue et, luctus tortor. Suspendisse molestie risus lorem, quis sagittis odio venenatis vel. Donec luctus commodo dolor ut sollicitudin. Cras faucibus sit amet odio vitae tincidunt. Suspendisse potenti. Proin odio nunc, hendrerit ut est eu, finibus consectetur urna. Quisque nec tincidunt eros. Cras tincidunt, lacus ac vehicula tincidunt, massa odio accumsan sem, non venenatis tortor lorem in orci.")}
    </PopoverComponent>
  </div>
}
