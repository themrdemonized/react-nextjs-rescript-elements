// This type is based on the getInitialProps return value.
// If you are using getServerSideProps or getStaticProps, you probably
// will never need this
// See https://nextjs.org/docs/advanced-features/custom-app
type pageProps

module PageComponent = {
  type t = React.component<pageProps>
}

type props = {
  @as("Component")
  component: PageComponent.t,
  pageProps: pageProps,
}


// We are not using `@react.component` since we will never
// use <App/> within our ReScript code.
// It's only used within `pages/_app.js`
let default = (props: props): React.element => {
  let {component, pageProps} = props

  let router = Next.Router.useRouter()

  let content = React.createElement(component, pageProps)

  switch router.route {
  | "/"
  | "/buttons" =>
    <MainLayout>
      <h1 > {React.string("Buttons")} </h1> 
      <div>
        content
      </div>
    </MainLayout>
  | "/textfields" =>
    <MainLayout>
      <h1 > {React.string("Textfields")} </h1> 
      <div>
        content
      </div>
    </MainLayout>
  | "/icons" =>
    <MainLayout>
      <h1 > {React.string("Icons")} </h1> 
      <div>
        content
      </div>
    </MainLayout>
  | "/checkboxes" =>
    <MainLayout>
      <h1 > {React.string("Checkboxes")} </h1> 
      <div>
        content
      </div>
    </MainLayout>
  | "/popovers" =>
    <MainLayout>
      <h1 > {React.string("Popovers")} </h1> 
      <div>
        content
      </div>
    </MainLayout>
  | "/examples" =>
    <MainLayout>
      <h1 > {React.string("Examples Section")} </h1> <div> content </div>
    </MainLayout>
  | _ => 
    <MainLayout>
      content
    </MainLayout>
  }
}
