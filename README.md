# Installation

1.  Clone repo through HTTP, which disallows pushing: `git clone https://github.com/hrichards/hunter_dotfiles.git`
2.  `cd hunter_dotfiles`
3.  `make linux` or `make mac`: you must choose which system you're running on
4.  Restart `tmux` or `Terminal`


# Recommended Technologies

-   **homebrew** to install everything you may be missing from.
-   Jenan Wise's **Codequality**
-   **iTerm2** as a replacement for `Terminal`, not least because it works best with...
-   ...**solarized** (http://ethanschoonover.com/solarized): the sane terminal color scheme
-   **vim**
-   **LaTeX**
-   **Markdown**
-   **bash**
-   **tmux**
-   **git**
-   **python**


# Getting Started

Here's a quick tour of the features available in these dotfiles:

1.  Play around with `bash`: the defaults and prompts are saner.
2.  Run `$ alias`: check out all the cool shortcuts, especially `ll`,
    `tree`, `gts`, `..`, `...`, and `du`.
3.  `~/.bash_eternal_history`: never forget a command again!
4.  Automatic integration with `Codequality`: never break the build over
    81 character lines again.
5.  Open `vim`. Isn't it a lot nicer?
6.  Open any file: its type should be recognized and highlighted (LaTeX,
    markdown, python, etc.). Press "\l" (backslash-el): you should be
    given a navigable sidebar with the structure of the document.
7.  Look at `~/.gitconfig`, under the `[alias]` section: these shortcuts
    are very helpful, especially `git lgga` and `git lggo`.
8.  Open `tmux`: the defaults are much better, and the command key has
    been remapped to the `vim`-compatible `Ctrl-t`.
9.  `vim` compatibility has been extended to the following languages:
    -   django templates
    -   coffeescript
    -   markdown
    -   LaTeX
10. Tab-completion is now available in `vim`, courtesy of `Tagbar`
11. And much more!

