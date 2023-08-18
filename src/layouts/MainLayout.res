%%private(@module("./MainLayout.module.scss") external styles: {..} = "default")

module Link = Next.Link

module Navigation = {
  @react.component
  let make = () =>
    <nav >
      <div className={styles["nav-bar"]}>
        <Link href="/"> {React.string("Home")} </Link>
        <Link href="/buttons"> {React.string("Buttons")} </Link>
        <a
          
          target="_blank"
          href="https://github.com/ryyppy/nextjs-default">
          {React.string("Github")}
        </a>
      </div>
    </nav>
}

@react.component
let make = (~children) => {
  let minWidth = ReactDOM.Style.make(~minWidth="20rem", ())
  <div style=minWidth >
    <div >
      <Navigation /> <main > children </main>
    </div>
  </div>
}
