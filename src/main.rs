use leptos::prelude::*;

fn main() {
    mount_to_body(App);
}

#[component]
fn App() -> impl IntoView {
    view! {
        <main>

            <div class = "container">

                <h1 class = "kaede106">
                    "Welcome to my website!"
                </h1>

                <p class = "info">
                    "Hello! I am kaede106. I am a second year Math/Computer Engineering student at UC Irvine."
                </p>

                <ul class = "links">
                    <li class = "links_link">
                        <a href="https://github.com/kaede106">My Github</a>
                    </li>
                    <li class = "links_link">
                        <a href="mailto:cpearlmanp@gmail.com">Email me!</a>
                    </li>
                </ul>
            </div>
        </main>
    }
}
