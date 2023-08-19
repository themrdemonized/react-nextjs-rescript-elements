%%private(@module("./MainLayout.module.scss") external styles: {..} = "default")

module Link = Next.Link

module Head = Next.Head

module Navigation = {
  @react.component
  let make = () =>
    <nav className={styles["v-header"]}>
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
  <>
    <Head>
      <title>{React.string("Rescript - React - NextJS - Trade elements")}</title>
    </Head>
    <div className={"kr-body"} >
      <div >
        <Navigation /> <main > children </main>
      </div>
    </div>
  </>
}
