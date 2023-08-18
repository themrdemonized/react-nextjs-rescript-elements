module P = {
  @react.component
  let make = (~children) => <p > children </p>
}

let default = () => {
  let (count, setCount) = React.useState(() => 0)

  <div>
    <h1 > {"What is this about?"->React.string} </h1>
    <P>
      {React.string(` This is a simple template for a Next
      project using ReScript`)}
    </P>
    <ButtonComponent onClick={_ => setCount(count => count + 1)}>
      {React.string(`count is ${count->Belt.Int.toString}`)}
    </ButtonComponent>
    <h2 > {React.string("Quick Start")} </h2>
    <pre>
      {React.string(`git clone https://github.com/rescript-nextjs-template.git my-project
cd my-project
rm -rf .git`)} //github.com/ryyppy/nextjs-default.git my-project
    </pre>
  </div>
}
